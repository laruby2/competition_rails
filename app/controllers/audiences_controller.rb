class AudiencesController < ApplicationController

  def new
    @round = Round.find_by(another_id: params[:round_id])
    if @round.audiences.include?(current_user)
      redirect_to round_url(@round.another_id) and return
    end
    @audience = @round.audiences.build
  end

  def create
    @round = Round.find_by(another_id: params[:round_id])
    @audience = @round.audiences.build(audience_params)
      require 'pry'; binding.pry
    if @audience.save
      @round = current_user.rounds.find_by(another_id: params[:round_id])
      redirect_to round_url(@round.another_id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def audience_params
    params.require(:audience).permit(:name).merge(user_id: current_user.id)
  end
end
