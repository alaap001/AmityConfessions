class Friendship < ApplicationRecord
belongs_to :amitian
belongs_to :friend, class_name: "Amitian"
end
