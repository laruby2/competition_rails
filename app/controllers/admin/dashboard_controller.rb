class Admin::DashboardController < ApplicationController
  before_action :require_signin

  def index
    @contestants = Contestant.first(5) # TODO
  end
end
