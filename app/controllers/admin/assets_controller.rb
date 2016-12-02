class Admin::AssetsController < ApplicationController

  def index
    #@assets = Asset.all
    if params[:query]
      @assets = Asset.where(city: params[:query])
    else
      @assets = Asset.all
    end
  end

end

