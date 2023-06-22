class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def comfirm
    @order = Order.new(order_params)
    
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name 
      
    elsif params[:order][:address_option] == "1"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
    def order_params
        params.require(:order).permit(:postal_code, :payment_method, :name, :address, :shipping_cost , :customer_id, :total_payment)
    end
end
