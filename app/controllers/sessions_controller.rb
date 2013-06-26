class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.authenticate(params[:user][:user_name], params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
