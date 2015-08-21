class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :zipcode
      t.string :city
      t.string :phone
      t.references :country, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true      

      t.timestamps null: false
    end
  end
end
