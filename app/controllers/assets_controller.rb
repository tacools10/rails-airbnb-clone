class AssetsController < ApplicationController
  before_action :find_user
  before_action :find_asset, only: [:edit, :destroy, :show]

  def index
    @assets = Asset.all
  end

  def show
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = @user.assets.build(asset_params)
    @asset.save!
    redirect_to user_assets_path(@user)
  end

  def edit
  end

  def update
    @asset.update(asset_params)
    @asset.save
    redirect_to user_assets_path
  end

  def destroy
    @asset.destroy
    redirect_to user_assets_path
  end

  private

  def asset_params
    params.require(:asset).permit(:title, :description, :price, :address, :country, :city, :condition, :year_built,
    :year_reno, :bedrooms, :bathrooms, :garage, :lots_size, :previous_owners, :status, :region, :address)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_asset
    @asset = Asset.find(params[:id])
  end
end
