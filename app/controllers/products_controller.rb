class ProductsController < ApplicationController
  http_basic_authenticate_with name: "osvaldo", password: "pravo"
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_path
  end

  def show
  end
  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price,:photo)
  end
end