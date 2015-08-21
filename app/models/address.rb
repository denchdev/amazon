class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :order
  belongs_to :customer

  validates_presence_of :address, :zipcode, :city, :phone
  validates :zipcode, format: {with: /\A[0-9]{5}\z/, message: "should contain 5 digits"}
end
