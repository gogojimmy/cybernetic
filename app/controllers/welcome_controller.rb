# -*- encoding : utf-8 -*-
#encoding: utf-8
class WelcomeController < ApplicationController
  layout 'welcome'
  def index
    @sliders = Slider.where(block: "首頁橫幅廣告").order("position").include_locale(params[:locale])
    @news = Post.news.include_locale(params[:locale]).last(5)
  end
end
