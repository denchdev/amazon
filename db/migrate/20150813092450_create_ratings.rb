class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :rewiev
      t.integer :rating
      t.references :book, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
