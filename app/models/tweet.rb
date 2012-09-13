class Tweet < ActiveRecord::Base
	attr_accessible :tweet_id, :content, :user_name, :twitter_name, :tweeted_at, :user_image

	def self.pull_tweets
	  @search = Twitter.search("#cfaATX -rt", :max_id => 244467320376918016)
	  @search.results.to_enum.each do |tweet|
	    unless exists?(tweet_id: tweet.id)
	      create!(
	        tweet_id: tweet.id,
	        content: tweet.text,
	        user_name: tweet.from_user_name,
	        twitter_name: tweet.user, 
	        tweeted_at: tweet.created_at,
	        user_image: tweet.profile_image_url_https
	      )
	    end
	  end
	end
end
