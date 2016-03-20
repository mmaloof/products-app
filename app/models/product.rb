class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  TAX_RATE = 0.09

  def description_all_caps
    description.upcase
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
