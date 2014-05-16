class ChangeDescriptionAndPlatformToTextInGames < ActiveRecord::Migration
  def change
    change_column :games, :description, :text
    change_column :games, :platform, :text
  end
end
