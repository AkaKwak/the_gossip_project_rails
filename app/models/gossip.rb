class Gossip < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 3..28 }
  validates :content, presence: true
end
