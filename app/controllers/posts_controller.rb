# -*- encoding : utf-8 -*-
class PostsController < ApplicationController

  def index
    @posts = Post.where(category: params[:category]).include_locale(params[:locale]).paginate(page: params[:page])
    @category = params[:category]
  end

  def show
    @post = Post.find(params[:id])
  end
end
