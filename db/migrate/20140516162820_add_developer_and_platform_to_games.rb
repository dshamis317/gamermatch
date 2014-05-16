class AddDeveloperAndPlatformToGames < ActiveRecord::Migration
  def change
    add_column :games, :developer, :string
    add_column :games, :platform, :string
  end
end
