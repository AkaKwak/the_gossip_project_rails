class User < ApplicationRecord
  has_many :gossips
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
