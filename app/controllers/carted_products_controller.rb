class CartedProductsController < ApplicationController
  def create
    cartedproduct = CartedProduct.create(
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      status: params[:status]
    )
    flash[:success] = "Hey look, you added some stuff to some fake cart!"
    redirect_to "/products/#{params[:product_id]}"
  end
end
