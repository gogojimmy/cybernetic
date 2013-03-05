#encoding: utf-8
class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    if params[:search]
      @products = Product.search(params)
    end
    @categories = Category.roots.order("position")
  end

  def new
    @product = Product.new
    @product.product_images.build
    @categories = ancestry_options(Category.scoped.arrange) {|i| "#{'-' * i.depth} #{i.title}" }
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
    @categories = ancestry_options(Category.scoped.arrange) {|i| "#{'-' * i.depth} #{i.title}" }
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
    category = @product.category
    @product.destroy
    redirect_to admin_category_path(category), notice: "#{name}刪除成功"
  end

  def ancestry_options(items, &block)
    return ancestry_options(items){ |i| "#{'-' * i.depth} #{i.name}" } unless block_given?

    result = []
    items.map do |item, sub_items|
      result << [yield(item), item.id]
      #this is a recursive call:
      result += ancestry_options(sub_items, &block)
    end
    result
  end
end
