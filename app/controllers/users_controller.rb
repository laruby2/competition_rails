class UsersController < ApplicationController
  before_action :require_signin, only: [:index]
  before_action :require_admin, only: [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :phone_number, :password)
  end
end
