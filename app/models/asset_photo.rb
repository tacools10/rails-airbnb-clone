class AssetPhoto < ApplicationRecord
  belongs_to :asset
  mount_uploader :photo, PhotoUploader
end
