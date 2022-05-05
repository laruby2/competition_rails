class Admin::DashboardController < ApplicationController
  before_action :require_signin
  before_action :require_admin

  def index
    @contestants = Contestant.first(5) # TODO
  end
end
