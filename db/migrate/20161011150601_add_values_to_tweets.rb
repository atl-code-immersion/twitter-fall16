class AddValuesToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :retweet, :boolean
    add_column :tweets, :retweet_id, :integer
  end
end
