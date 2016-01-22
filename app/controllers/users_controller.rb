class UsersController < ApplicationController
	def index
		@list = User.all
	end
	
	def new
		@user = User.new
	end
	
	def create
		#@user = User.create!(user_params)
		@user = User.create!(
			name: params[:user][:name],
			email: params[:user][:email],
		)
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
		@user.update_attributes!(user_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find_by(id: params[:id])
		@user.destroy!
		redirect_to users_path
	end


	private
		def user_params
			params.require(:user).permit(:avatar)
		end
end
