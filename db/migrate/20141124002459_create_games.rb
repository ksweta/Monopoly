class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :status,  default: 0, null: false
      t.integer :turn,   default: 0
      t.integer :winner, default: 0

      t.timestamps
    end
  end
end
