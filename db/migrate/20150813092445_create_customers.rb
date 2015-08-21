class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|      
      t.string :firstname
      t.string :lastname
      t.belongs_to :billing_address, index: true
      t.belongs_to :shipping_address, index: true

      t.timestamps null: false
    end
  end
end
