class CartedProduct < ActiveRecord::Base
  belongs_to :user
  has_many :products
  
end
