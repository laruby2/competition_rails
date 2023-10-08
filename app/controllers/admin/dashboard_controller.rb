class Admin::DashboardController < ApplicationController
  before_action :require_signin
  before_action :require_admin

  def index
    @users = User.count
    @rounds = Round.count
  end
end
