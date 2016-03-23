class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  TAX_RATE = 0.09

  def name_all_caps
    name.upcase
  end

  def sales_tax
    tax_amount = price * TAX_RATE
    tax_amount.ceil(2)
  end

  def total
    price + sales_tax
  end

  def sale_message
    if total < 5
      message = "This shit is on sale!"
    end
    message 
  end
end
