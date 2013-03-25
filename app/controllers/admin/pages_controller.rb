# -*- encoding : utf-8 -*-
#encoding: utf-8
class Admin::PagesController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @pages = Page.paginate(page: params[:page])
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.user = current_user
    if @page.update_attributes(params[:page])
      redirect_to admin_pages_path, notice: "成功更新了#{@page.title}"
    else
      render :edit
    end
  end

end
