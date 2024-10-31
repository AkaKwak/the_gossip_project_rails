class User < ApplicationRecord
  has_many :gossips
  has_many :comments, dependent: :destroy
  has_secure_password
  belongs_to :city, optional: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :password, presence: true, length: { minimum: 6 }
end
