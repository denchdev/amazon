class OrderStepsController < ApplicationController
  include Wicked::Wizard
  steps :address, :delivery, :payment, :confirm, :complete
  
  def show
    @user = current_customer ? current_customer : Customer.new
    @order = current_order
    render_wizard
  end
  
  def update
    @order = current_order
    @order.attributes = params[:order]
    render_wizard @order
  end
  
private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for your purchase."
  end
end
