# -*- encoding : utf-8 -*-
#encoding: utf-8
class Admin::PostsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to edit_admin_post_path(@post), notice: "#{@post.title}建立成功"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user = current_user
    if @post.update_attributes(params[:post])
      redirect_to edit_admin_post_path(@post), notice: "#{@post.title}更新成功"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    title = @post.title
    @post.destroy
    redirect_to admin_posts_path, notice: "#{title}刪除成功"
  end
end
