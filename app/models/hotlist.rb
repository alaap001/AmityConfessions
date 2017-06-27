class Hotlist < ApplicationRecord

belongs_to :hotlister, class_name: "Amitian"
  belongs_to :hotlisted, class_name: "Amitian"

  validates :hotlister_id, presence: true
  validates :hotlisted_id, presence: true

end
