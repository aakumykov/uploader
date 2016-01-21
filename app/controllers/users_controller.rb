class UsersController < ApplicationController
  def create
	  @user = User.new(
		  name: params[:user][:name], 
		  email: params[:user][:email],
		  avatar: params[:user][:avatar],
	  )
	  @user.save!
	  redirect_to users_path
  end

  def show
	  @user = User.find_by(id: params[:id])
  end

  def edit
	  @user = User.find_by(id: params[:id])
  end

  def update
	  @user = User.find_by(id: params[:id])
	  @user.update_attributes!(
		  name: params[:user][:name], 
		  email: params[:user][:email],
	  )
	  redirect_to user_path(@user)
  end

  def destroy
	  @user = User.find_by(id: params[:id])
	  @user.destroy!
	  redirect_to users_path
  end

  def index
	  @list = User.all
  end

  def new
	  @user = User.new
  end
end
