class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.string :user_name
      t.string :twitter_name
      t.text :content
      t.date :tweeted_at
      t.string :user_image
      t.timestamps
    end
  end
end