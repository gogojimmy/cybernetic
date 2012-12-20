#encoding: utf-8
class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @products = Product.paginate(page: params[:page])
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(params[:product])
    @product.user = current_user
    if @product.save
      redirect_to edit_admin_product_path(@product), notice: "#{@product.name}新增成功"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.user = current_user
    if @product.update_attributes(params[:product])
      redirect_to edit_admin_product_path(@product), notice: "#{@product.name}更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    name = @product.name
    @product.destroy
    redirect_to admin_products_path, notice: "#{name}刪除成功"
  end
end
