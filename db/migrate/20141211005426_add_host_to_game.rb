class AddHostToGame < ActiveRecord::Migration
  def change
    add_column :games, :host, :string
  end
end
