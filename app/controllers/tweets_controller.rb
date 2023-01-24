class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
      if params[:question1] == nil
        @tweets= Tweet.all
      elsif params[:question1] == ''
        @tweets= Tweet.all
      else
        @tweets = Tweet.where(body: params[:question1], season: params[:question2], feel: params[:question3])
      end
    end

    def new
        @tweet = Tweet.new
      end

      def create
        tweet = Tweet.new(tweet_params)

        tweet.user_id = current_user.id

        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @tweet = Tweet.find(params[:id])
      end

      def edit
        @tweet = Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end

      def test
      end
    
      private
      def tweet_params
        params.require(:tweet).permit(:body,:season,:feel,:image)
      end
end
