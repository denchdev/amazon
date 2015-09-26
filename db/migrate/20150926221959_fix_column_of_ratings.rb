class FixColumnOfRatings < ActiveRecord::Migration
  def change
	remove_column :ratings, :rewiev, :string
  	add_column :ratings, :review, :string
  end
end
