#encoding: utf-8
class Admin::StoresController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @stores = Store.paginate(page: params[:page])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params[:store])
    if @store.save
      redirect_to edit_admin_store_path(@store), notice: '新增成功'
    else
      render :new
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(params[:store])
      redirect_to edit_admin_store_path(@store), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    name = @store.name
    @store.destroy
    redirect_to admin_stores_path, notice: "#{name}刪除成功"
  end
end
