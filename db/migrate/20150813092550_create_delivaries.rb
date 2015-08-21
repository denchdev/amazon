class CreateDelivaries < ActiveRecord::Migration
  def change
    create_table :delivaries do |t|
      t.string :name
      t.float :price

      t.timestamps null: false
    end
  end
end
