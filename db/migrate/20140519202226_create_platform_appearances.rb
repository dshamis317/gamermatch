class CreatePlatformAppearances < ActiveRecord::Migration
  def change
    create_table :platform_appearances do |t|
      t.references :game, index: true
      t.references :platform, index: true
      t.timestamps
    end
  end
end
