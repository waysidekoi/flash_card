class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id, :deck_id
      t.timestamps
    end
    add_index :games, :user_id
  end
end
