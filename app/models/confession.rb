class Confession < ApplicationRecord
  #validations
  validates :confession , presence: true
  belongs_to :amitian
  has_many :confessioncomments , dependent: :destroy
  acts_as_votable
  mount_uploader :confessionimage , ConfessionimageUploader
  has_many :notifications, dependent: :destroy
  acts_as_taggable # Alias for acts_as_taggable_on :tags
end
