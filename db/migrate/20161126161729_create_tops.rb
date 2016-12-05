class CreateTops < ActiveRecord::Migration[5.0]
  def change
    create_table :tops do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.string :topplayer
      t.string :comment

      t.timestamps
    end
  end
end
