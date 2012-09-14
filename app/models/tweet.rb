class Tweet < ActiveRecord::Base
	attr_accessible :tweet_id, :content, :user_name, :twitter_name, :tweeted_at, :user_image

	def self.pull_tweets
	  @search = Twitter.search("#cfaATX -rt", since_id: Tweet.maximum('tweet_id'), :include_entities => true, :rpp => 150)
	  @search.results.to_enum.each do |tweet|
	    unless exists?(tweet_id: tweet.id)
	      create!(
	        tweet_id: tweet.id,
	        content: tweet.text,
	        user_name: tweet.from_user_name,
	        twitter_name: tweet.from_user, 
	        tweeted_at: tweet.created_at,
	        user_image: tweet.profile_image_url_https
	      )
	    end
	  end
	end

	#fetch tweets that were stored locally but no longer being returned by the API on the production site
	def self.lost_tweets
		lost_tweets = [244461617994166272, 244461410753593345, 244459373076824065, 244458786193043456, 244458095315664896, 244457590933843968, 244456995564969984, 244456416369340416, 244454906474397697, 244454522884354048, 244454301362184193, 244454179031109632, 244452751923363840, 244451874412060672, 244451061404938240, 244448696123658242, 244439469011374082, 244429396671336448]
		lost_tweets.each do |tweet_id|
			@grab = Twitter.status(tweet_id)
			unless exists?(tweet_id: tweet_id)
	      create!(
	        tweet_id: @grab.id,
	        content: @grab.text,
	        user_name: @grab.user.name,
	        twitter_name: @grab.user.screen_name, 
	        tweeted_at: @grab.user.created_at,
	        user_image: @grab.user.profile_image_url_https
	      )
			end
		end
	end

	def display_hashtag(string)
		matches = string.scan(/#([a-z0-9_]+)/i)
		matches.each do |match| 
			string.gsub(match, '<a href="https://twitter.com/search/<%= match %>">match</a>')
		end
	end

end






