class AssetsController < ApplicationController
  before_action :find_user, except: [:favorite]
  before_action :find_asset, only: [:edit, :update, :destroy, :show, :favorite]

  def index
    @assets = @user.assets.order(:id)
    @favorites = @user.favorites
  end

  def show
    @asset_coordinates = { lat: @asset.latitude, lng: @asset.longitude }
    unless @asset.latitude.nil?
      @hash = Gmaps4rails.build_markers(@asset) do |asset, marker|
        marker.lat asset.latitude
        marker.lng asset.longitude
      end
    end
  end

  def new
    @asset = Asset.new
  end

  # def create
  #   asset = Asset.new(asset_params)
  #   asset.photos = params[:asset][:photos]
  #   raise
  #   if asset
  #     redirect_to user_assets_path(@user)
  #   end
  #   # @asset = @user.assets.build(asset_params)
  #   # @asset.save!
  # end

  def create
    @asset = current_user.assets.create(asset_params)
    # Need to update the below to work for Heroku in case someone does not add photo
    params[:asset_photos]['photo'].each do |photo|
      @asset_photos = @asset.asset_photos.create(:photo => photo)
    end
    redirect_to user_assets_path(current_user)
  end

  def edit

  end

  def update
    @asset.update!(asset_params)
    redirect_to user_assets_path
  end

  def destroy
    @asset.destroy!
    redirect_to user_assets_path
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @asset
      redirect_to :back, notice: 'You favorited #{@asset.title}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@asset)
      redirect_to :back, notice: 'Unfavorited #{@asset.title}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  private

  def asset_params
    params.require(:asset).permit(:title, :description, :price, :address, :country, :city, :post_code, :condition, :year_built,
    :year_reno, :bedrooms, :bathrooms, :garage, :lots_size, :previous_owners, :status, :region, :address, asset_photos_attributes: [:id, :asset_id, :photo])
  end

  def find_user
    @user = current_user
  end

  def find_asset
    @asset = Asset.find(params[:id])
  end
end
