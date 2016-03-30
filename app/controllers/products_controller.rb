class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :run_search]

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
    
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
    render "index.html.erb"
  end

  def new 
    @product = Product.new
    render 'new.html.erb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      material: params[:material],
      user_id: current_user.id 
    )
    if @product.save
      flash[:success] = "Hey, thanks for adding that shit!"
      redirect_to "/products/#{@product.id}"
    else 
      render "new.html.erb"
    end
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(
      name: params[:name],
      price: params[:price],
      material: params[:material]
    )
      flash[:success] = "Product successfully updated, thanks dude. I guess..."
      redirect_to "/products/#{@product.id}"
    else
      render "edit.html.erb"
    end
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

  private 

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
end