class PostsController < ApplicationController

  def index
    @posts = Post.where(category: params[:category]).paginate(page: params[:page])
    @category = params[:category]
  end

  def show
    @post = Post.find(params[:id])
  end
end
