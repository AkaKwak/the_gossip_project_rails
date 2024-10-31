class User < ApplicationRecord
  has_many :gossips
  belongs_to :city
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
