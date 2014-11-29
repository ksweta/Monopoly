class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :cardtype,    null: false
      t.belongs_to :game,     null: false, index: true
      t.belongs_to :player,   index: true
      t.boolean :used,        default: false
      t.text :description,    null: false

      t.timestamps
    end
  end
end
