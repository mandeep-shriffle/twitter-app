class TweetsController < ApplicationController
	
	before_action :authenticate_user!


	def index
		tweets = Tweet.feeds(current_user).order("tweets.created_at #{params[:order_by] || 'ASC'}")
		render json: {tweets: tweets, each_serializer: TweetSerializer}, status: 200
	end

	def create
		tweet = current_user.tweets.build(tweet_params)
		if tweet.save
			render json: {tweet: tweet, serializer: TweetSerializer}, status: 200
		else
			render json: {error: "Something went wrong"}, status: 422
		end
	end

	private

		def tweet_params
			params.require(:tweet).permit(:body)
		end

end
