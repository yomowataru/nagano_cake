class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]) 
    # 全件数を数えるため、allメソッドを定義する
    items_all = Item.all
    @items_count = items_all.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new 
  end
end
