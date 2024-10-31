class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { in: 3..28 }
  validates :content, presence: true
end
