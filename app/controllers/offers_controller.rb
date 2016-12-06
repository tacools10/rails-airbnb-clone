class OffersController < ApplicationController
  before_action :find_user
  before_action :find_asset, except: [:index]
  before_action :set_offer, only: [:show, :edit, :destroy, :update]

  def index
    @offers = @user.offers
    @assets_offers = @user.assets.map do  |singleasset|
      singleasset.offers
    end
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = @asset.offers.build(offer_params)
    @offer.user = current_user
    if current_user
      @offer.save!
      redirect_to user_asset_offers_path(current_user)
    else
      redirect_to new_user_registration_path
    end
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    redirect_to user_offers_path(current_user, @offers)
  end

  def destroy
    @offer.destroy
    redirect_to offers_path(@offers)
  end

  private

  def offer_params
    params.require(:offer).permit(:offer_date, :status, :offer_type, :asset_id, :user_id)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end
end
