class UsersController < ApplicationController
	before_action :debug_info

	def index
		@list = User.all
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		
		puts "===== UsersController#create ====="
		puts @user.avatar
		puts "===== UsersController#create ====="
		
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
		if @user.update_attributes(user_params)
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find_by(id: params[:id])
		@user.destroy!
		redirect_to users_path
	end


	private
		def user_params
			params.require(:user).permit(
				:name, 
				:email, 
				:avatar, 
				:kind,
			)
		end
		
		def debug_info
			puts ''
			puts "========== debug_info starts =========="
			ap params
			#~ if !params[:user].nil?
				#~ puts params[:user][:avatar].content_type if params[:user].has_key?(:avatar)
			#~ end
			puts "========== debug_info ends =========="
			puts ''
		end
end
