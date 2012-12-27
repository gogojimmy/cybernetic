#encoding: utf-8
class WelcomeController < ApplicationController
  layout 'welcome'
  def index
    @sliders = Slider.where(position: "首頁橫幅廣告")
    @news = Post.news.last(5)
  end
end
