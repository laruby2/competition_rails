class RoundsController < ApplicationController
  before_action :require_signin

  def new
    @round = Round.new
  end

  def create
    @round = current_user.rounds.build(round_params)

    if @round.save
      redirect_to round_url(@round.another_id)
    else
      flash.now[:alert] = "New Round Adding not successful"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @round = current_user.rounds.find_by(another_id: params[:id])
  end

  private

  def round_params
    params.require(:round).permit(:title)
  end
end
