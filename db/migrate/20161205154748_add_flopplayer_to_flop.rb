class AddFlopplayerToFlop < ActiveRecord::Migration[5.0]
  def change
    add_column :flops, :flopplayer, :string
  end
end
