class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy] 
  
  # 一覧ページ
  def index
    @tweets = Tweet.all
  end
  
  # 投稿ページ
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  # 編集ページ
  def edit
  end
  
  # 投稿確認ページ
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
        redirect_to tweets_path
    else
      render new
    end
  end
  
  def update
    if @tweet.update(tweets_params)
      redirect_to tweets_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
  def tweets_params
    params.require(:tweet).permit(:content)
  end
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end