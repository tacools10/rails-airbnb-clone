class OffersController < ApplicationController
  before_action :find_user
  before_action :find_asset
  before_action :set_offer, only: [:show, :edit, :destroy, :update]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = @asset.offers.build(offer_params)
    if current_user
      @offer.save
      redirect_to user_asset_offers_path(@user)
    else
      redirect_to new_user_registration_path
    end
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
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
