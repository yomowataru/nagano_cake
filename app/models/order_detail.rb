class OrderDetail < ApplicationRecord
  
  belongs_to :order
  
  
  def  add_tax_price
    (item.price * 1.10).floor
  end
  
end
