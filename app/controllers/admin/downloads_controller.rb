#encoding: utf-8
class Admin::DownloadsController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @downloads = Download.paginate(page: params[:page])
  end

  def new
    @download = Download.new
  end

  def edit
    @download = Download.find(params[:id])
  end

  def create
    @download = Download.new(params[:download])
    if @download.save
      redirect_to edit_admin_download_path(@download), notice: '檔案新增成功'
    else
      render :new
    end
  end

  def update
    @download = Download.find(params[:id])
    if @download.update_attributes(params[:download])
      redirect_to edit_admin_download_path(@download), notice: '檔案更新成功'
    else
      render :edit
    end
  end

  def destroy
    @download = Download.find(params[:id])
    name = @download.name
    @download.destroy
    redirect_to admin_downloads_path, notice: "#{name}刪除成功"
  end
end
