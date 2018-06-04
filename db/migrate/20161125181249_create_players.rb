class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.string :name
      t.string :shirt_number
      t.string :field_position
    end
  end
end
