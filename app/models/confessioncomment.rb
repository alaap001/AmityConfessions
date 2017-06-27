class Confessioncomment < ApplicationRecord
belongs_to :amitian
belongs_to :confession
validates :content,presence: true
end
