class CreditCard < ActiveRecord::Base
  belongs_to :customer
  has_many :orders

  validates_presence_of :number, :CVV, :expiration_month, :expiration_year, :firstname, :lastname
  validates :number, length:  { is: 16 }
  validates :CVV, length:  { is: 3 }
  validates :expiration_month, :expiration_year, length:  { is: 2 }
  validates :number, :CVV, :expiration_month, :expiration_year, format: { with: /\A\d+$\z/ }
  validates :expiration_month, format: { with: /\A(0+[1-9]|1+[12])\z/ }
  validates :expiration_year, format: { with: /\A(1+[5-9]|[2-9]+[1-9])\z/ }
end
