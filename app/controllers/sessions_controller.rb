class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: user_find)
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Welcome to TailStyle'
      redirect_to root_path
    else
      flash.now[:alert] = 'Wrong username'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_find
    params[:session][:username]
  end
end
