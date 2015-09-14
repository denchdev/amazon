require 'reform/form/coercion'
require 'reform/rails'

class PaymentForm < Reform::Form
  #include DSL
  #include Reform::Form::ActiveModel
  #include Reform::Form::Coercion
  
  property :credit_card do
    properties :number
    properties :CVV
    properties :first_name
    properties :last_name
  end

  model :order

  def save
    super
    model.save
  end
end

