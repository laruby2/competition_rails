class UsersController < ApplicationController
  before_action :require_signin, only: [:index, :show]
  before_action :require_admin, only: [:index]
  before_action :require_telephone, only: [:new, :create]

  def new
    @user = User.new
    @user.phone_number = session[:telephone]
  end

  def create
    @user = User.new(user_params)
    @user.phone_number = session[:telephone]

    if @user.save
      session[:user_id] = @user.id
      session[:telephone] = nil
      redirect_to session[:intended_url] || root_url
    else
      flash.now[:alert] = "Sign up not successful: #{@user.errors.full_messages.to_sentence}"
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(another_id: params[:id])

    if @user && @user == current_user
      render
    else
      redirect_to root_url, notice: "Not your user page"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :phone_number, :password)
  end

  def require_telephone
    unless session[:telephone]
      redirect_to signin_url
    end
  end
end
