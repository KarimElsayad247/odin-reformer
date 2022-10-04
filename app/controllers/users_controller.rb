class UsersController < ApplicationController
  def create
    # @user = User.new(params[:user])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      pp @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def new

  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
