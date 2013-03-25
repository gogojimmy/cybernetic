# -*- encoding : utf-8 -*-
#encoding: utf-8
class MarketingsController < ApplicationController

  def create
    if params[:commit] == I18n.t("functions.unsubscribe_btn")
      @marketing = Marketing.find_by_email(params[:marketing][:email])
      if @marketing.present?
        @marketing.destroy
        flash[:notice] = I18n.t("instructions.unsubscribe_success")
      else
        flash[:notice] = I18n.t("instructions.cant_find_this_email")
      end
    else
        @marketing = Marketing.new(params[:marketing])
        if @marketing.save
          flash[:notice] = "感謝您的加入，我們會不定時寄送電子報"
        else
          flash[:notice] = "這個Email已經加入過了，如果您沒有收到來自我們的信件請您檢查一下是否在垃圾郵件中，或是請與我們客服聯繫"
        end
    end
  end
end
