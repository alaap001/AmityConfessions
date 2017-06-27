class Eventpost < ApplicationRecord
  belongs_to :event
  belongs_to :amitian
  has_many :eventcomments , dependent: :destroy
  acts_as_votable
  validates :content , presence: true
  mount_uploader :event_post_image , EventpostimageUploader
end

