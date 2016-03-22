class ProductsController < ApplicationController
  def random
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product = Product.all.sample
    render 'show.html.erb'
  end

  def index
    @products = Product.all
    sort_attribute = params[:sort]
    sort_descending = params[:desc]

    if sort_attribute != nil
      @products = Product.order(sort_attribute)
    elsif sort_descending != nil
      @products = Product.order({sort_descending => :desc})
    end

    sort_discount = params[:discount]
    if sort_discount != nil
      @products = Product.where('price < ?', 10)
    end
    render "index.html.erb"
  end

  def new 
    render 'new.html.erb'
  end

  def create
    Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      material: params[:material],
      user_id: current_user.id 
    )
    flash[:success] = "Wow, thanks for doing my job for me!"
    redirect_to "/products/#{@product.id}"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'edit.html.erb'
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      material: params[:material]
    )
    flash[:success] = "Product successfully updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:warning] = "You destroyed my fucking product!!!"
    redirect_to "/products"
  end

  def run_search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%" + search_term + "%")
    render 'index.html.erb'
  end
end