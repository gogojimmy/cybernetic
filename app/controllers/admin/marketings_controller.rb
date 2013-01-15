class Admin::MarketingsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    if params[:format] == 'xls'
      @marketings = Marketing.all
    else
      @marketings = Marketing.paginate(page: params[:page])
    end
    respond_to do |format|
      format.html
      format.xls
    end
  end
end
