class OrderForm
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persisted?
    false
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Order")
  end

  delegate :firstname, :lastname, to: :customer
  delegate :address, :zipcode, :city, :phone, :country,  to: :address, prefix: :ship

  def initialize(customer)
  	@customer = customer ? customer : Customer.new
  end

  def customer
  	@customer
  end

  def address
	@address ||= Address.new
  end 

  def submit
  	customer.attributes = params.slice(:firstname, :lastname)
  	address.attributes = params.slice(:address, :zipcode, :city, :phone, :country)
  	if valid?      
      customer.save!
      address.save!
      true
    else
      false
    end
  end
  	
  end





end