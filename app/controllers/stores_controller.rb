# -*- encoding : utf-8 -*-
class StoresController < ApplicationController
  def show
    @stores = Store.where(store_type: params[:id])
  end
end
