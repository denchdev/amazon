class OrderStepsController < ApplicationController
  include Wicked::Wizard
  steps :address, :delivery, :payment, :confirm, :complete
  before_action :load_order
  
  def show
    case step
      when :delivery
        init_delivery
      when :confirm
        check_order
    end
    render_wizard
  end
  
  def update
    case step      
      when :address
        return render_wizard unless update_addresses
      when :delivery
        return redirect_to :back, notice: (I18n.t"cart.delivery.check_delivery") unless update_delivery_service
      when :payment
        return render_wizard unless update_credit_card
      when :confirm
        check_order
        @order.checkout!
        return redirect_to order_path(@order)
      when :complete
        
    end
    render_wizard @order
  end
  
private

  def load_order
    @order = current_order
    init_addresses
    init_credit_card
  end

  def check_order
    jump_to(:address) unless @order.shipping_address and @order.billing_address
    jump_to(:delivery) unless @order.delivery_service
    jump_to(:payment) unless @order.credit_card
  end

  def init_addresses
    if current_customer
      @order.shipping_address ||= current_customer.shipping_address.dup if current_customer.shipping_address
      @order.billing_address ||= current_customer.billing_address.dup if current_customer.billing_address
    end
    @order.shipping_address ||= Address.new(customer: current_customer)
    @order.billing_address ||= Address.new(customer: current_customer)
  end

  def init_delivery
    @delivery_services = DeliveryService.all
    @order.delivery_service ||= @delivery_services[0]
  end

  def init_credit_card
    @order.credit_card ||= CreditCard.new(customer: current_customer)
  end

  def update_delivery_service
    @order.delivery_service = DeliveryService.find_by_id(params[:delivery])
  end

  def update_credit_card
    @order.credit_card ||= CreditCard.new(customer: current_customer)
    @order.credit_card.update credit_card_params
  end

  def update_addresses
    init_addresses
    is_billing_updated = @order.billing_address.update address_params(:billing_address)

    if params[:use_billing_address] == "yes"
      is_shipping_updated = @order.shipping_address.update address_params(:billing_address)
    else
      is_shipping_updated = @order.shipping_address.update address_params(:shipping_address)
    end

    # Update user address
    if current_customer      
      current_customer.shipping_address ||= @order.shipping_address
      current_customer.billing_address ||= @order.billing_address
      current_customer.save
    end

    is_shipping_updated && is_billing_updated
  end

  def update_order
    params[:items].each do |item|
      order_item = @order.order_items.find(item[:id])
      order_item.update(quantity: item[:quantity])
    end
  end

  def credit_card_params
    params.require(:credit_card).permit(:number, :CVV, :expiration_month, :expiration_year, :first_name, :last_name)
  end

  def address_params(type)
    params.require(type).permit(:address, :zip_code, :phone, :city, :country)
  end
end
