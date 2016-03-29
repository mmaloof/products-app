class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product 
  has_many :carted_products
  has_many :products, through: :carted_products

  TAX_RATE = 0.09
end
