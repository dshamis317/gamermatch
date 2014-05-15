class CreategameOwnershiptable < ActiveRecord::Migration
  def change
    create_table :game_ownership do |t|
      t.references :user
      t.references :game
    end
  end
end
