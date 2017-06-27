class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Amitian"
  belongs_to :followed, class_name: "Amitian"
  
   validates :follower_id, presence: true
   validates :followed_id, presence: true
   
end
