class ContestantsController < ApplicationController
  before_action :require_signin

  def index
    # TODO: all contestants of current round
    @contestants = Contestant.first(5)
  end
end
