class OrderStepsController < ApplicationController
  include Wicked::Wizard
  steps :address, :delivery, :payment, :confirm, :complete
  
  def show
    @order_form = OrderForm.new(current_customer)
    @order = current_order
    @order_items = @order.order_items
    render_wizard
  end
  
  def update
    @order = current_order
    @order.attributes = params[:order_form]
    render_wizard @order
  end
  
private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for your purchase."
  end
end
