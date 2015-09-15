class AddAddressIdToOrder < ActiveRecord::Migration
  def change
  	add_reference :orders, :billing_address, index: true
  	#add_index :orders, :billing_address
  	add_reference :orders, :shipping_address, index: true
  	#add_index :orders, :shipping_address
  end
end
