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
      # Use create.turbo_stream.erb
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @contestant = Contestant.find(params[:id])
    @contestant.destroy
    # Use destroy.turbo_stream.erb
  end

  private

  def contestant_params
    params.require(:contestant).permit(:name, :location)
  end
end
