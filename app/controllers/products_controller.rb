class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    gon.active_id = @product.category.id
  end
end
