class Asset < ApplicationRecord

    ## Data validations
    ## Presence should be true for all attributes except region. Only unique requirement is addresss.
    ## Do we want to make title unique as well?
    validates :title, :description, :price, :address, :country, :city, :condition, :year_built,
    :year_reno, :bedrooms, :bathrooms, :garage, :lots_size, :previous_owners, :status, :region, presence: true
    validates :address, uniqueness: { case_sensitive: false }

    ## Data Associations
    belongs_to :user
    # validates_associated :user
    has_many :offers
    # validates_associated :offer
end


