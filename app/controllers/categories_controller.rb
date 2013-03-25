# -*- encoding : utf-8 -*-
class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if @category.locales.include?(params[:locale])
      @category
      gon.active_id = @category.id
    else
      redirect_to root_path, notice: I18n.t('product.no_locale_for_this')
    end
  end
end
