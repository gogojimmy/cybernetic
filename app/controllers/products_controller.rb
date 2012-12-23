class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    gon.category_id = @product.category.id
  end
end
