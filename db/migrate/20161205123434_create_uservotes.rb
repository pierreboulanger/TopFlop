class CreateUservotes < ActiveRecord::Migration[5.0]
  def change
    create_table :uservotes do |t|
      t.references :user, foreign_key: true
      t.references :top, foreign_key: true
      t.references :flop, foreign_key: true

      t.timestamps
    end
  end
end
