class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  def  add_tax_price
    (item.price * 1.10).floor
  end
  
  def subtotal
    self.add_tax_price * amount
  end
  
  def amounts
    
    
  end
end
