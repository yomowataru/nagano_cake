class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    
    # @order_detail = OrderDetail.where(order_id: params[:id])
    @order_detail = OrderDetail.all
    @amounts = 0
  end
end
