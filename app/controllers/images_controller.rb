class ImagesController < ApplicationController
  def index
    @images = Image.all
    sort = params[:sort_order]
    if sort && sort_order
      @images = image.order(sort => sort_order)
    end
  end

  def new
    render 'new.html.erb'
  end

  def create
    image = Image.create(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )

    redirect_to "/images/#{image.id}"
  end

  def show
    if params[:id] == "random"
      images = Image.all
      @image = images.sample
    else
      @image = Image.find_by(id: params[:id])
    end
  end

  def update
    image_id = params[:id]
    @image = Image.find_by(id: Image_id)
    @image.update(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
      )
    redirect_to "/image/#{@image.id}"
  end

  def destroy
    image_id = params[:id]
    @image = Image.find_by(id: Image_id)
    @image.destroy
    redirect_to "/images"
  end

  def search
    search_term = params[:search]
    @images = Image.where("name LIKE ?", "%#{search_term}%")
    render 'index.html.erb'
  end
end
