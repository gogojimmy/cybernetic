# -*- encoding : utf-8 -*-
#encoding: utf-8
class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @categories = Category.arrange(order: :position)
    @category = Category.new
  end

  def new
    @category = Category.new(:parent_id => params[:parent_id])
  end

  def sort
    params[:category].each_with_index do |id, index|
      Category.find(id).update(position: index + 1)
    end
    render nothing: true
  end

  def create
    @category = Category.new(params[:category])
    @category.user = current_user
    if @category.save
      redirect_to admin_categories_path, notice: "#{@category.title}新增成功"
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.paginate(page: params[:page])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.user = current_user
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path, notice: "#{@category.title}更新成功"
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    title = @category.title
    @category.destroy
    redirect_to admin_categories_path, notice: "#{title}刪除成功"
  end

end
