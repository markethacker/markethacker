class ProductsController < ApplicationController

  before_action :find_a_product, only: [:destroy]

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_param)
    if product.save
      product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find_by_pid(params[:id])
    render :json => @product
  end

  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.json { render :json => @products }
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def find_a_product
    @product = Product.find(params[:id])
  end

  def product_param
    params.require(:product).permit(:name, :price, :avatar, :desc, :pid)
  end

end
