class AddGiantbombIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :gb_id, :integer
  end
end
