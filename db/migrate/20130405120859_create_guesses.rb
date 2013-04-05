class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.boolean :correct
      t.integer :game_id, :card_id
      t.timestamps
    end
  end
end
