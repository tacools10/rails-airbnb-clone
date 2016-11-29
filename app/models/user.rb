class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Data validations
  validates :name, :last_name, :birthdate, presence: true
  # validates :company, allow_blank: true

  # Associations
  has_many :assets
  # validates_associated :assets
  has_many :offers
  # validates_associated :offers

end
