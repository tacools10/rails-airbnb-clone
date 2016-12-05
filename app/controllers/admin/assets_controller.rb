class Admin::AssetsController < ApplicationController

  def index
    #@assets = Asset.all
    if params[:query]
      @assets_search = Asset.search do
        without :latitude, nil
        keywords(params[:query])
        paginate(:page => (params[:page] or 1), :per_page => 30)
      end
      @assets = @assets_search.results
    else
      @assets = Asset.all
    end
    @all_assets_hash = Gmaps4rails.build_markers(@assets.class.name == "ActiveRecord::Relation" ? @assets.where.not(latitude: nil) : @assets) do |asset, marker|
        marker.lat asset.latitude
        marker.lng asset.longitude
    end
  end
end

