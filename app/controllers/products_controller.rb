class ProductsController < ApplicationController
  
  before_action :find_a_product, only: [:destroy]

  def show
    @product = Product.find_by_pid(params[:id])
    render :json => @product
  end

  def index
  	@products = Product.all
  end

  def destroy
  	@product.destroy
    redirect_to products_path
  end

  private 
  def find_a_product
    @product = Product.find(params[:id])
  end

end
