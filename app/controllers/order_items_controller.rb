class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = current_order.order_items
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
   if cookies[:current_order]
      if Order.where(id: cookies[:current_order]).empty?
        cookies[:current_order] = Order.create(total_price: 0.01).id
      end
    else
      cookies[:current_order] ||= Order.create(total_price: 0.01).id      
    end    
    @order_item = OrderItem.create(price: 0, quantity: 0)    
    
    respond_to do |format|
      if @order_item.add_to_order(params[:book_id], params[:quantity], cookies[:current_order])
        format.html { redirect_to order_items_path}
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { redirect_to root_path, alert: 'Order not create'}
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end   
      
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_path, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def clear_cart   
    
    current_order.order_items.destroy_all
    
    redirect_to order_items_path    
  end

  private
   
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    #Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit( :quantity, :order_id, :book_id)
    end
end
