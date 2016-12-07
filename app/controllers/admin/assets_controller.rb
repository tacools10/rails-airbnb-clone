class Admin::AssetsController < ApplicationController

  def ranges
    @price_ranges = [{to: 200000}, {from: 200000, to: 500000}, {from: 500000}]
  end

  def search(params)
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
      @assets_search = Asset.search query, fields: fields, where: conditions
      @assets = @assets_search.results
  end


  def index
    @disable_footer = true

    if params[:query_price_min] || params[:query_price_max] || params[:city]
      @assets = search(params)
      respond_to do |format|
        @all_assets_hash = Gmaps4rails.build_markers(@assets.class.name == "ActiveRecord::Relation" ? @assets.where.not(latitude: nil) : @assets) do |asset, marker|
          marker.lat asset.latitude
          marker.lng asset.longitude
          marker.infowindow render_to_string(partial: "/assets/map_box", locals: { asset: asset })
          end
        format.html {render 'assets/assets'}
        format.js
      end
    elsif params[:query]
      @assets = search(params)
      @all_assets_hash = Gmaps4rails.build_markers(@assets.class.name == "ActiveRecord::Relation" ? @assets.where.not(latitude: nil) : @assets) do |asset, marker|
          marker.lat asset.latitude
          marker.lng asset.longitude
          marker.infowindow render_to_string(partial: "/assets/map_box", locals: { asset: asset })
      end
    else
      @assets = Asset.all
      @all_assets_hash = Gmaps4rails.build_markers(@assets.class.name == "ActiveRecord::Relation" ? @assets.where.not(latitude: nil) : @assets) do |asset, marker|
        marker.lat asset.latitude
        marker.lng asset.longitude
        marker.infowindow render_to_string(partial: "/assets/map_box", locals: { asset: asset })
     end
    end

  end

end

