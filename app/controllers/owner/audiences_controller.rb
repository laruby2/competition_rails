class Owner::AudiencesController < ApplicationController
  before_action :require_signin

  def index
    @owner = current_user
    if @round = @owner.rounds.find_by(another_id: params[:round_id])
      @audiences = @round.audiences.all
    else
      redirect_to user_url(current_user.another_id), notice: "owner only"
    end
  end

  # def destroy
  #   @audience = @owner.audiences.find(params[:id])
  #   @audience.destroy
  #   # Use destroy.turbo_stream.erb
  # end
end
