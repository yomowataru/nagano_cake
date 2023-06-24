class Item < ApplicationRecord
  has_one_attached :image
  
  has_many :cart_items, dependent: :destroy 
  has_many :order_details, dependent: :destroy
  
  # (width,height)
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg') 
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def  add_tax_price
    (self.price * 1.10).floor
  end
  
  
  
end
