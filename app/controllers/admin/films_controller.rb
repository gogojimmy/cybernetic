# -*- encoding : utf-8 -*-
#encoding: utf-8
class Admin::FilmsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @films = Film.paginate(page: params[:page])
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(params[:film])
    @film.user = current_user
    if @film.save
      redirect_to admin_films_path, notice: "成功新增影片"
    else
      render :new
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    @film.user = current_user
    if @film.update_attributes(params[:film])
      redirect_to admin_film_path(@film), notice: "成功更新了影片"
    else
      render :edit
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to admin_films_path, notice: '成功刪除影片'
  end

end
