class VotesController < ApplicationController
  before_action :set_round
  before_action :find_contestant

  def create
    existing_vote = @contestant.votes.where(user: current_user).first
    return if existing_vote

    vote = @contestant.votes.create!(user: current_user)
    @contestant.my_vote = vote
    render partial: "activity/votes", locals: { contestant: @contestant }
  end

  def destroy
    existing_vote = @contestant.votes.where(user: current_user).first
    return unless existing_vote

    existing_vote.destroy!
    render partial: "activity/votes", locals: { contestant: @contestant }
  end

  private

  def find_contestant
    @contestant = @round.contestants.find(params[:contestant_id])
  end

  def set_round
    @round = Round.find_by(another_id: params[:round_id])
  end
end
