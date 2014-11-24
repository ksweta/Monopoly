class CreateGametiles < ActiveRecord::Migration
  def change
    create_table :gametiles do |t|
      t.integer :tiletype,   null: false
      t.string :name,        null: false
      t.belongs_to :player, index: true
      t.belongs_to :game,    null: false, index: true
      t.text :description,   null: false
      t.float :mortgage,     default: 0.0, null: false
      t.float :cost,         default: 0.0, null: false
      t.integer :color,      null: false
      t.integer :position,   null: false

      t.timestamps
    end
  end
end
