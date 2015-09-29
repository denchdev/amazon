class FixCountry < ActiveRecord::Migration
  def change
    remove_column :addresses, :country_id, :integer
    add_column :addresses, :country, :string
  end
end
