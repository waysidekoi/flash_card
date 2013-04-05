class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.string :front, :back
    end
    add_index :cards, :deck_id
  end
end
