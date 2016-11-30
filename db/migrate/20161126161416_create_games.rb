class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :team, foreign_key: true
      t.string :opponent_name
      t.string :date
      t.string :score
      t.string :top
      t.string :flop

      t.timestamps
    end
  end
end
