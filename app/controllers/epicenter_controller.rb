class EpicenterController < ApplicationController

	before_filter :authenticate_user!

  def feed
    @tweet = Tweet.new

    @followercount = 0
    User.all.each do |u|
      if u.following.include?(current_user.id)
        @followercount += 1
      end
    end

  	@following_tweets = []

  	Tweet.all.each do |tweet|

  		if current_user.following.include?(tweet.user_id) || tweet.user_id == current_user.id
  			@following_tweets.push(tweet)
  		end
  	end

  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save
  	redirect_to :back
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save
  	redirect_to :back
  end

  def following
    @users = []

    User.all.each do |user|
      if current_user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @users = []

    User.all.each do |user|
      if user.following.include?(current_user.id)
        @users.push(user)
      end
    end
  end

  def all_users
    @users = User.all
  end




end
