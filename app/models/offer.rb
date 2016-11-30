class Offer < ApplicationRecord

  ## Data validations
  ## Do we want to make title unique as well?
  validates :offer_date, :status, :offer_type, presence: true


  ## Data Associations
  belongs_to :user
  # validates_associated :user
  belongs_to :asset
  # validates_associated :asset

  after_initialize :init
  def init
    self.status ||= "pending"
  end

end
