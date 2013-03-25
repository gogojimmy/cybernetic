# -*- encoding : utf-8 -*-
#encoding: utf-8
class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to new_contact_path, notice: "感謝您的意見，我們會儘快為您處理"
    else
      render :new
    end
  end
end
