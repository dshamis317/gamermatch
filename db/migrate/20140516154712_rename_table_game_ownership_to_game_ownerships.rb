class RenameTableGameOwnershipToGameOwnerships < ActiveRecord::Migration
  def change
      rename_table :game_ownership, :game_ownerships
  end
end
