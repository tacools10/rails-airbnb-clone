class Admin::AssetsController < ApplicationController

  def filter_search(params)
    permitted = params.require(:asset).permit([:address, :city, :post_code, :country])
    query = '*'
      conditions = {}
      conditions[:price] = (if params[:query_price_min].present? && params[:query_price_max].blank?
                              {gte: params[:query_price_min]}
                           elsif params[:query_price_max].present? && params[:query_price_min].blank?
                              {lte: params[:query_price_max]}
                           else params[:query_price_min].present? && params[:query_price_max].present?
                              {gte: params[:query_price_min], lte: params[:query_price_max]}
                           end) if params[:query_price_min].present? || params[:query_price_max].present?

      conditions[:city] = params[:city] if params[:city].present?
      conditions[:country] = params[:country] if params[:country].present?
      conditions[:location] = {near: get_coordinates(params), within: params[:radius]} if permitted[:address].present? && params[:radius].present?
      @assets_search = Asset.search query, where: conditions
      @assets = @assets_search.results
  end

  def text_search(params)
    query = params[:query].presence || '*'
      fields = [:address, :city, :post_code]
      @assets_search = Asset.search query, fields: fields
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

    p params[:ex1Slider]

    if params[:query_price_min] || params[:query_price_max] || params[:city] || params[:radius]
      @assets = filter_search(params)
      gon.assets = @assets
      @all_assets_hash = build_map(@assets)
      p @all_assets_hash;

      respond_to do |format|
        format.html {render(:partial => 'assets', locals: {assets: @assets})}
        format.js {render 'index', locals: {assets: @assets}}
      end

      # Need to figure out how to keep dropdown form available / refresh
    elsif params[:query]
      @assets = text_search(params)
      gon.assets = @assets
      @all_assets_hash = build_map(@assets)

    else
      @assets = Asset.all
      gon.assets = @assets
      @all_assets_hash = build_map(@assets)
      p @all_assets_hash
    end

    p @assets.length
  end

   private


   def build_map(assets)
    assets_with_coordinates = assets.select {|asset| !asset[:latitude].nil?}
     Gmaps4rails.build_markers(assets_with_coordinates) do |asset, marker|
        marker.lat asset.latitude
        marker.lng asset.longitude
        # marker.picture({
        #   # url: "http://res.cloudinary.com/djlrrh291/image/upload/v1481212242/ooyviohrkqdsuqruzot2.jpg",
        #   # width: 25,
        #   # height: 25
        #   rich_marker: "<div class='my-marker'>It works!<img height='30' width='30' src='http://farm4.static.flickr.com/3212/3012579547_097e27ced9_m.jpg'/></div>"
        # })
        # marker.infowindow render_to_string(partial: "/assets/map_box", locals: { asset: asset })

      end
   end



end

