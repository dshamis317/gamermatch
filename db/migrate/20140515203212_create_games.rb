class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.date :release_date
      t.string :image_url
      t.string :publisher
      t.string :genre
      t.timestamps
    end
  end
end
