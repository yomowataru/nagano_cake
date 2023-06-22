class Customer < ApplicationRecord
  def active_for_authentication?
    super && (is_deleted == false)
  end 
  
  # 氏名をくっつけて表示するため、full_nameメソッドを作成
  def full_name
    self.last_name + self.first_name
  end
  
  def full_name_kana
    self.last_name_kana + self.first_name_kana 
  end
  
  has_many :cart_items, dependent: :destroy 
  has_many :orders, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
