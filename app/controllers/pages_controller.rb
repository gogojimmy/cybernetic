# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end
end
