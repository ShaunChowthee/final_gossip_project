class Gossip < ApplicationRecord
  belongs_to :user
  validates :author, presence: true
  validates :content, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }

end
