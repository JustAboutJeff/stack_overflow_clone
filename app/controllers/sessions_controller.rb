class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.validate(params[:user])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # TODO: error handling
      # @errors = @user.errors
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
