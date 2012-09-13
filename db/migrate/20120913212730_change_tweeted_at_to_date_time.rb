class ChangeTweetedAtToDateTime < ActiveRecord::Migration
  def change
  	change_table :tweets do |t|
      t.change :tweeted_at, :datetime
    end
  end

end
