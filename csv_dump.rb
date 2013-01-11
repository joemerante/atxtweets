#export tweets to csv
require 'csv'

#get all tweets from db
tweets = Tweet.find(:all)

#set your filepath
#CSV.open("path/to/file.csv", "wb") do |csv|
CSV.open("tweets.csv", "wb") do |csv|
  tweets.each do |tweet|
    csv << [tweet.id, tweet.user_name, tweet.twitter_name, tweet.content, tweet.tweeted_at, tweet.user_image, tweet.created_at, tweet.updated_at, tweet.tweet_id]
  end
end