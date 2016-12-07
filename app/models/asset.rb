class Asset < ApplicationRecord

    ## Data validations
    ## Presence should be true for all attributes except region. Only unique requirement is addresss.
    ## Do we want to make title unique as well?
    validates :title, :description, :price, :address, :country, :city, :post_code, :condition, :year_built,
    :year_reno, :bedrooms, :bathrooms, :garage, :lots_size, :previous_owners, :status, :region, presence: true
    validates :address, uniqueness: { case_sensitive: false }

    ## Data Associations
    belongs_to :user
    # validates_associated :user
    has_many :offers
    # validates_associated :offer

    searchkick locations: ["location"]

    def address_combined
      [address,city,post_code,country].compact.join(', ')
    end

    def search_data
      attributes.merge location: {lat: latitude, lon: longitude}
    end

    # def address_combined_changed?
    #   @asset.address_changed?
    # end
    geocoded_by :address_combined
    after_validation :geocode, if: :address_changed?
end


