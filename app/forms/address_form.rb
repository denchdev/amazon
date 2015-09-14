require 'reform/form/coercion'
require 'reform/rails'

class AddressForm < Reform::Form
  #include DSL
  #include Reform::Form::ActiveModel
  #include Reform::Form::Coercion

  properties :firstname 
  properties :lastname

  #properties [:firstname, :lastname], on: :user
  #properties [:address, :zipcode, :sity], on: :address

  model :customer

  validates :firstname, :lastname, presence: true

  def save
    super
    model.save
  end
end

