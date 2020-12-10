class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to TailStyle, you can start writting articles"
      redirec_to root
    else
      flash[:alert] = @user.errors.full_messages.join('. ')
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def users_params
    params.require(:user).permit(:username, :name, :email, :password)
  end
end