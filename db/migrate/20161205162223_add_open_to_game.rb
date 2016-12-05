class AddOpenToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :open, :string
  end
end
