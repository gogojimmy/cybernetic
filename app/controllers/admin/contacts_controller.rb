class Admin::ContactsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @contacts = Contact.paginate(page: params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
