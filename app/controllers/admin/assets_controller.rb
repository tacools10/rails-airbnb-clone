class Admin::AssetsController < ApplicationController

  def index
    #@assets = Asset.all
    if params[:query]
      @assets = Asset.where(city: params[:query])
    else
      @assets = Asset.all
    end
    @all_assets_hash = Gmaps4rails.build_markers(@assets.where.not(latitude: nil)) do |asset, marker|
        marker.lat asset.latitude
        marker.lng asset.longitude
      end

  end

end

