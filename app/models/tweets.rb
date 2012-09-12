class Tweets < ActiveRecord::Base
	attr_accessible :content, :screen_name, :tweet_id

	def self.pull_tweets
	  #Twitter.favorites("joemerante", since_id: maximum(:tweet_id)).each do |tweet|
	  Twitter.search("#cfaATX -rt", :rpp => 100, since_id: maximum(:tweet_id))
	    unless exists?(tweet_id: tweet.results.id)
	      create!(
	        tweet_id: tweet.results.id,
	        content: tweet.results.text,
	        user_name: tweet.results.from_user_name,
	        twitter_name: tweet.results.user, 
	        tweeted_at: tweet.results.created_at,
	        user_image: tweet.results.profile_image_url_https
	      )
	    end
	  end
	end

end

