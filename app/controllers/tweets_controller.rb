class TweetsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def show
    #  before_action @tweet = Tweet.find(params[:id])
  end

  def edit
    # before_action @tweet = Tweet.find(params[:id])
  end

  def update
    # before_action @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet saved' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    # before_action @tweet = Tweet.find(params[:id])

    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Destruction complete!' }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
