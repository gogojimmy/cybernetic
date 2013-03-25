# -*- encoding : utf-8 -*-
class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    if @product.category.locales.include?(params[:locale])
      @product
      gon.active_id = @product.category.id
    else
      redirect_to root_path, notice: I18n.t('product.no_locale_for_this')
    end
  end

  def index
    @products = Product.search(params)
  end
end
