class Gallery < ApplicationRecord
	belongs_to :amitian
mount_uploader :g1, G1Uploader
mount_uploader :g2, G2Uploader
mount_uploader :g3, G3Uploader
mount_uploader :g4, G4Uploader
mount_uploader :g5, G5Uploader
mount_uploader :g6, G6Uploader
end
