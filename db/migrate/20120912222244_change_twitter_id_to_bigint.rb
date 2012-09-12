class ChangeTwitterIdToBigint < ActiveRecord::Migration

  def change
  	remove_column :tweets, :tweet_id
    add_column :tweets, :tweet_id, :integer, :limit => 8
  end

end
