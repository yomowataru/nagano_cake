class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def confirm
    @order = Order.new(order_params)
    
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name 
      
    elsif params[:order][:address_option] == "1"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      
    else
      render 'new'
      
    end
    
    @cart_items = current_customer.cart_items.all 
    @total = 0
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.add_tax_price
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
    
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all 
    
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])
    @total = 0
    
    
  end
  
  private
    def order_params
        params.require(:order).permit(:postal_code, :payment_method, :name, :address, :shipping_cost , :customer_id, :total_payment)
    end
end
