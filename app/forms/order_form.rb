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
  delegate :delivary, to: :delivery
  delegate :number, :CVV, :expiration_month, :expiration_year, :firstname, :lastname, to: :credit_card

  def initialize(customer)
  	@customer = customer ? customer : Customer.new
  end

  def customer
  	@customer
  end

  def address
	  @address ||= Address.new
  end 

  def delivery
    @delivery ||= Delivery.new
  end 

  def credit_card
    @credit_card ||= CreditCard.new
  end 

  def submit(params)
  	customer.attributes = params.slice(:firstname, :lastname)
  	address.attributes = params.slice(:ship_address, :ship_zipcode, :ship_city, :ship_phone, :ship_country)
  	if valid?      
      #customer.save!
      address.save!
      true
    else
      false
    end
  end
  	
  
end