# -*- encoding : utf-8 -*-
#encoding: utf-8
class Admin::UsersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @users = User.paginate(page: params[:page])
  end

  def approve
    @user = User.find(params[:user_id])
    if @user.update_attributes(approved: true)
      redirect_to admin_users_path, notice: "#{@user.email}權限提昇成功"
    else
      redirect_to admin_users_path, notice: "#{@user.email}權限提昇失敗"
    end
  end

  def unapprove
    @user = User.find(params[:user_id])
    if @user.update_attributes(approved: false)
      redirect_to admin_users_path, notice: "#{@user.email}權限降級成功"
    else
      redirect_to admin_users_path, notice: "#{@user.email}權限降級失敗"
    end
  end
end
