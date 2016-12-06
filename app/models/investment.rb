class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :asset
  belongs_to :group
end
