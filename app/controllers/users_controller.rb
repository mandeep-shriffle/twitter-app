class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show]

	def show
		render json: { user: @user, serializer: UserSerializer}, status: 200
	end

	private 

		def ser_user
			@user = User.find(params[:id])
			render json: {error: "Not found"} unless @user 
		end

end
