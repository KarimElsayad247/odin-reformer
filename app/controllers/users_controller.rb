class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    # @user = User.new(
    #   username: params[:username],
    #   email: params[:email],
    #   password: params[:password]
    # )
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) # Absolutely no password validation I know
      flash[:notice] = "User updated!"
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
