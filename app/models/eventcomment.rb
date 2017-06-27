class Eventcomment < ApplicationRecord
  belongs_to :eventpost
  belongs_to :amitian
   validates :content , presence: true
end

