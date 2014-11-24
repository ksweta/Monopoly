class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :game,   null: false, index: true
      t.belongs_to :user,    index: true 
      t.float :balance,      default: 300.00
      t.integer :position,   default: 0

      t.timestamps
    end
  end
end
