class UsersController < ApplicationController
	def index
		@list = User.all
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		begin
			@user.save!
			redirect_to users_path
		rescue
			render :new
		end
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		puts "===== Users#update, params: =====> #{params}"
		@user = User.find_by(id: params[:id])
		
		#@user.avatar = nil if not params[:user][:avatar].nil?
		
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
			params.require(:user).permit(:name, :email, :avatar)
		end
end
