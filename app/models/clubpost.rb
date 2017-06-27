class Clubpost < ApplicationRecord
  belongs_to :club
  has_many :clubscomments , dependent: :destroy
   acts_as_votable
  validates :content , presence: true
  mount_uploader :clubpost_image , ClubpostImageUploader
  belongs_to :amitian
end
