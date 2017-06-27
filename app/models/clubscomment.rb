class Clubscomment < ApplicationRecord
  belongs_to :clubpost
  belongs_to :amitian
  validates :content , presence: true
end
