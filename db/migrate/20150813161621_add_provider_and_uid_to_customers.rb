class AddProviderAndUidToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :uid, :string
    add_column :customers, :provider, :string
  end
end
