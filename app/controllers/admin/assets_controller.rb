class Admin::AssetsController < ApplicationController

  def ranges
    @price_ranges = [{to: 200000}, {from: 200000, to: 500000}, {from: 500000}]
  end




  def search(params)
    permitted = params.require(:asset).permit([:address, :city, :post_code, :country])
    query = params[:query].presence || '*'
      fields = [:address, :city, :post_code]

      conditions = {}
      conditions[:price] = (if params[:query_price_min].present? && params[:query_price_max].blank?
                              {gte: params[:query_price_min]}
                           elsif params[:query_price_max].present? && params[:query_price_min].blank?
                              {lte: params[:query_price_max]}
                           else params[:query_price_min].present? && params[:query_price_max].present?
                              {gte: params[:query_price_min], lte: params[:query_price_max]}
                           end) if params[:query_price_min].present? || params[:query_price_max].present?

      conditions[:city] = Asset.find(params[:city]).city if params[:city].present?
      conditions[:country] = Asset.find(params[:country]).country if params[:country].present?
      conditions[:location] = {near: get_coordinates(params), within: params[:radius]} if permitted[:address].present? && params[:radius].present?

      @assets_search = Asset.search query, fields: fields, where: conditions
      @assets = @assets_search.results
  end

  def get_coordinates(params)
    permitted = params.require(:asset).permit([:address, :city, :post_code, :country])
    if permitted[:address].present?
      geocoder_address = [permitted[:address],permitted[:city],permitted[:post_code],permitted[:country]].compact.join(', ')
      coordinate_array = Geocoder.coordinates(geocoder_address)
      coordinate_hash = {}
      coordinate_hash[:lat] = coordinate_array[0]
      coordinate_hash[:lon] = coordinate_array[1]
      return coordinate_hash
    else
      return nil
    end
  end

  def index
    @disable_footer = true

    if params[:query_price_min] || params[:query_price_max] || params[:city] || params[:radius]
      @assets = search(params)
      respond_to do |format|
        format.html {render 'assets/assets'}
        format.js
      end

      # Need to figure out how to keep dropdown form available / refresh
    elsif params[:query]
      @assets = search(params)
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

