require 'reform/form/coercion'
require 'reform/rails'

class DeliveryForm < Reform::Form
  #include DSL
  #include Reform::Form::ActiveModel
  #include Reform::Form::Coercion

  properties :delivery 

  model :order

  def save
    super
    model.save
  end
end

