class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :destroy]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = current_user.offers.create(offer_params)
     if @offer.save
      redirect_to offers_path
     else
      render :new
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

end
