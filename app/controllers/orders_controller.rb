class OrdersController < ApplicationController
  def create
    Order.create({
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity]
                 })
    render 'show.html.erb' 
  end
end