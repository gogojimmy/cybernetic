class WelcomeController < ApplicationController
  def index
    @sliders = Slider.all
    @news = Post.news.last(5)
  end
end
