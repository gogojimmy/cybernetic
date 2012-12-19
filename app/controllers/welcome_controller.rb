class WelcomeController < ApplicationController
  def index
    @sliders = Slider.all
  end
end
