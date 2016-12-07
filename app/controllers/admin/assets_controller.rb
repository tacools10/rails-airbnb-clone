class Admin::AssetsController < ApplicationController

  def ranges
    @price_ranges = [{to: 200000}, {from: 200000, to: 500000}, {from: 500000}]
  end


  def index
    #@assets = Asset.all
    price_ranges = self.ranges
    @disable_footer = true
    if params[:query]
      @assets_search = Asset.search params[:query], fields: [:title, :city], where: {latitude: {not: nil}}
      @assets = @assets_search.results

    # Add min / max plus add in filters for latitude / longitude. Should be able to repeat this process for other features like
    # size, etc. in order to create variety of filters. Can even create dropdown form now that I understand
    # the process.
    elsif params[:query_price_min] || params[:query_price_max]
      @assets_search = Asset.search '*', where: {price: {gte: params[:query_price_min], lte: params[:query_price_max]}}
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

