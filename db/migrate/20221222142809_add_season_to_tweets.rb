class AddSeasonToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :season, :string
  end
end
