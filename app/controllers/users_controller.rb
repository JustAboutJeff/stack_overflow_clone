class UsersController < ApplicationController

  def index
    @users = User.order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = user.errors
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to user_path(user)
  end

  def destroy
    User.destroy(params[:id])
    redirect_to users_path
  end

end
