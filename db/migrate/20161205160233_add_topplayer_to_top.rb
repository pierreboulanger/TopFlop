class AddTopplayerToTop < ActiveRecord::Migration[5.0]
  def change
    add_column :tops, :topplayer, :string
  end
end
