class Owner::ContestantsController < ApplicationController
  before_action :require_signin
  before_action :set_round

  def index
    @contestants = @round.contestants.all
  end

  def create
    @contestant = @round.contestants.build(contestant_params)
    if @contestant.save
      # Use create.turbo_stream.erb
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @contestant = @round.contestants.find(params[:id])
    @contestant.destroy
    # Use destroy.turbo_stream.erb
  end

  private

  def contestant_params
    params.require(:contestant).permit(:name, :location)
  end

  def set_round
    @round = Round.find_by(another_id: params[:round_id])
  end
end
