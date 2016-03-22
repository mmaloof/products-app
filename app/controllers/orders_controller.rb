class OrdersController < ApplicationController
  def create 
    order = Order.create({
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity]
     })
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end