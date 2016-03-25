class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :products
  belongs_to :order 
  
end
