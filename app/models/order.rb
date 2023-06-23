class Order < ApplicationRecord
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  def  add_tax_price
    (item.price * 1.10).floor
  end
  
end
