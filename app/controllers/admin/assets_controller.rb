class Admin::AssetsController < ApplicationController

  def index
    #@assets = Asset.all
    if params[:query]
      @assets_search = Asset.search params[:query], fields: [:title, :city], where: {latitude: {not: nil}}
      @assets = @assets_search.results
    else
      @assets = Asset.all
    end
    @all_assets_hash = Gmaps4rails.build_markers(@assets.class.name == "ActiveRecord::Relation" ? @assets.where.not(latitude: nil) : @assets) do |asset, marker|
        marker.lat asset.latitude
        marker.lng asset.longitude
        marker.infowindow render_to_string(partial: "/assets/map_box", locals: { asset: asset })
    end
  end
end

