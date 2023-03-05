class ContestantsController < ApplicationController
  before_action :require_signin

  def index
    @contestants = Contestant.all
    @contestants = current_user.assign_my_votes_to_contestants(@contestants)
  end
end
