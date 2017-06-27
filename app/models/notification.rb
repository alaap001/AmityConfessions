class Notification < ApplicationRecord
  belongs_to :amitian
  belongs_to :notified_by, class_name: 'Amitian'
  belongs_to :confession
  belongs_to :club
 
end
