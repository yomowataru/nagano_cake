class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    @cart_items = current_customer.cart_items.all
    redirect_to cart_items_path
    
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
