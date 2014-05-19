class DeletePlatformFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :platform
  end
end
