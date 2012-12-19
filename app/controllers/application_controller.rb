class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :find_nav_categories

  def find_nav_categories
    @categories = Category.roots
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end
end
