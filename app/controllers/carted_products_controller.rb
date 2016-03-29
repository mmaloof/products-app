class CartedProductsController < ApplicationController
  def create
    cartedproduct = CartedProduct.create(
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      status: "carted"
    )
    flash[:success] = "Hey look, you added some stuff to some fake cart!"
    redirect_to "/products/#{params[:product_id]}"
  end

  def index
    @carted_products = current_user.carted_products.where(status: 'carted')
    if @carted_products.length == 0
      flash[:warning] = "Dude, there is nothing in your damn cart."
      redirect_to "/"
    else
      render 'index.html.erb'
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "You removed that shit! Nice!"
    redirect_to "/carted_products"
  end 
end