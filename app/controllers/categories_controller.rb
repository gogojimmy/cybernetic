class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @all_categories = Category.all
  end
end
