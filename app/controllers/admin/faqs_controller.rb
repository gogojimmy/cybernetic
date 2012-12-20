#encoding: utf-8
class Admin::FaqsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @faqs = Faq.all
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    @faq.user = current_user
    if @faq.save
      redirect_to edit_admin_faq_path(@faq), notice: "#{@faq.question}新增成功"
    else
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    @faq.user = current_user
    if @faq.update_attributes(params[:faq])
      redirect_to edit_admin_faq_path(@faq), notice: "#{@faq.question}更新成功"
    else
      render :edit
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    question = @faq.question
    @faq.destroy
    redirect_to admin_faqs_path, notice: "#{question}刪除成功"
  end
end
