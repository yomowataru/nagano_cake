class Customer < ApplicationRecord
  def active_for_authentication?
    super && (is_deleted == false)
  end 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
