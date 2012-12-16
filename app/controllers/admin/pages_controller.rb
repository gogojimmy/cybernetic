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
    if @page.update_attributes(params[:page])
      redirect_to admin_page_path(@page), notice: "成功更新了#{@page.title}"
    else
      render :edit
    end
  end

end
