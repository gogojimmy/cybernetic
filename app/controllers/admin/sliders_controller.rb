#encoding: utf-8
class Admin::SlidersController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  def index
    @width_sliders = Slider.where(block: "首頁橫幅廣告").order("position")
    @sliders = Slider.where("block != ?", "首頁橫幅廣告")
  end

  def new
    @slider = Slider.new
  end

  def create
    @slider = Slider.new(params[:slider])
    if @slider.save
      redirect_to admin_sliders_path, notice: "建立成功"
    else
      render :new
    end
  end

  def edit
    @slider = Slider.find(params[:id])
  end

  def update
    @slider = Slider.find(params[:id])
    @slider.user = current_user
    if @slider.update_attributes(params[:slider])
      redirect_to admin_sliders_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy
    redirect_to admin_sliders_path, notice: '刪除成功'
  end

  def sort
    params[:slider].each_with_index do |id, index|
      Slider.update_all({position: index + 1}, {id: id})
    end
    render nothing: true
  end
end
