class ContestantsController < ApplicationController
  before_action :require_signin
  before_action :set_round

  def index
    @contestants = @round.contestants.order(:created_at)
    if @contestants.any?
      @contestants = current_user.assign_my_votes_to_contestants(@contestants)
    end
  end

  private

  def set_round
    @round = Round.find_by(another_id: params[:round_id])
  end
end
