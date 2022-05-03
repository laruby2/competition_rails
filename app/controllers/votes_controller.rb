class VotesController < ApplicationController
  before_action :find_contestant

  def create
    vote = @contestant.votes.create!(user: current_user)
    # ...
    @contestant.my_vote = vote
    render partial: "activity/votes", locals: { contestant: @contestant }
  end

  def destroy
    existing_vote = @contestant.votes.where(user: current_user).first
    existing_vote.destroy!
    # ...
    render partial: "activity/votes", locals: { contestant: @contestant }
  end

  private

  def find_contestant
    @contestant = Contestant.find(params[:contestant_id])
  end
end
