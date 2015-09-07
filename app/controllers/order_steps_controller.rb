class OrderStepsController < ApplicationController
  include Wicked::Wizard
  steps :address, :delivery, :payment, :confirm, :complete
  
  def show
    @order_form = current_order_form
    @order = current_order
    @order_items = @order.order_items
    render_wizard
  end
  
  def update
    @order_form = current_order_form
    @order_form.submit(params[:order])
    render_wizard @order_form
  end
  
private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for your purchase."
  end

  def current_order_form
    @current_order_formr ||= OrderForm.new(current_customer)
  end
end
