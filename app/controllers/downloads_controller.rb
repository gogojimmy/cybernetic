# -*- encoding : utf-8 -*-
class DownloadsController < ApplicationController

  def index
    @downloads = Download.paginate(page: params[:page])
  end

end
