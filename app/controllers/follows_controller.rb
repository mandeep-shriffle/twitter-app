class FollowsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_follow, only: [:unfollow]

	def follow
		follow = Follow.new(follow_params.merge({user_id: current_user.id}))
		if follow.save
			render json: {message: "Suceessfully followed"}, status: 200
		else
			render json: {error: "Something went wrong"}, status: 422
		end
	end

	def unfollow
		if @follow.destroy
			render json: {message: "Suceessfully unfollowed"}, status: 200
		else
			render json: {error: "Something went wrong"}, status: 422
		end
	end

	private

	def follow_params
		params.require(:follow).permit(:followed_user_id)
	end

	def set_follow
		@follow = Follow.find(params[:id])
		render json: {error: "Not found"} unless @follow and return		
	end

end
