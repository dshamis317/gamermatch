class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.integer :user_id
      t.string :platform_name
      t.timestamps
    end
  end
end
