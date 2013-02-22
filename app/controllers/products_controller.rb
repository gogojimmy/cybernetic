class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    gon.active_id = @product.category.id
  end

  def index
    @products = Product.search(params)
  end
end
