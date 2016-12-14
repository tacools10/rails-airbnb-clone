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

  def text_search_home(params)
    query = params[:query].presence || '*'
      fields = [:address, :city, :post_code, :price, :title, :country]
      @assets_search = Asset.search query, fields: fields
      @assets = @assets_search.results
  end

  def text_search_search_page(params)
    query = params[:query_filter_page].presence || '*'
      fields = [:address, :city, :post_code, :price, :title, :country]
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
    @show_search = true

    if params[:query_price_min] || params[:query_price_max] || params[:city] || params[:radius]
      @assets = filter_search(params)
      gon.assets = @assets

      respond_to do |format|
        format.html {render(:partial => 'assets', locals: {assets: @assets})}
        format.js {render 'index', locals: {assets: @assets}}
      end

    elsif params[:query]
      @assets = text_search_home(params)
      gon.assets = @assets

    elsif params[:query_filter_page]
      @assets = text_search_search_page(params)
      gon.assets = @assets

      respond_to do |format|
        format.html {render(:partial => 'assets', locals: {assets: @assets})}
        format.js {render 'index', locals: {assets: @assets}}
      end

    else
      @assets = Asset.all
      gon.assets = @assets
    end

  end


end

