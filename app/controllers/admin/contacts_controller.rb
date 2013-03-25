#encoding: utf-8
class Admin::ContactsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @contacts = Contact.paginate(page: params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path, notice: '刪除成功'
  end
end
