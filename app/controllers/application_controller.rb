class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    if I18n.locale != :zh_tw
      gon.locale = "not_zh_tw"
    end
  end
end
