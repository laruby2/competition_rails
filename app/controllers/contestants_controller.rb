class ContestantsController < ApplicationController
  before_action :require_signin

  def index
    @contestants = Contestant.first(5) # TODO: all contestants of current round
    @contestants = current_user.assign_my_votes_to_contestants(@contestants)
  end
end
