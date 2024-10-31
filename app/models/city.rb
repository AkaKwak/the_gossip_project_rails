class City < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :gossips, through: :users
end
