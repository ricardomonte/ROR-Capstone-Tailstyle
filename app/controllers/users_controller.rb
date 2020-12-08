class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirec_to root
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:username, :name, :email, :password)
  end
end