class Admin::ContestantsController < ApplicationController
  before_action :require_signin
  before_action :require_admin

  def index
    @contestants = Contestant.all
  end

  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.new(contestant_params)
    if @contestant.save
      redirect_to admin_contestants_url
    else
      render 'new'
    end
  end

  private

  def contestant_params
    params.require(:contestant).permit(:name, :location)
  end
end
