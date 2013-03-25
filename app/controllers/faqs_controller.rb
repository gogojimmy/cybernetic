# -*- encoding : utf-8 -*-
class FaqsController < ApplicationController

  def index
    @faqs = Faq.all
  end
end
