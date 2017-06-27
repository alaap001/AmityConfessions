class Club < ApplicationRecord
	belongs_to :amitian
	has_many :events, dependent: :destroy

	 has_many :clubposts, dependent: :destroy
	 mount_uploader :club_cover , ClubCoverUploader
	 mount_uploader :club_themepic , ClubThemepicUploader
	 validates :clubname , presence: true, length: { minimum: 2, maximum: 50 } 
	 validates :club_theme , presence: true, length: { minimum: 2, maximum: 200 }  
	 validates :description , presence: true, length: { minimum: 2, maximum: 1000 } 
	 validates :niche , presence: true
 

has_many :clubmembers 
has_many :invitations , class_name: "Clubmember" , foreign_key: "club_id"
has_many :active_invitations, ->{ where(clubmembers: { accepted: true}) }, through: :clubmembers, source: :amitian
has_many :received_invitations, -> { where(clubmembers: { accepted: true}) }, through: :invitations, source: :club
has_many :pending_invitations, -> {where(clubmembers: {accepted: false})} , through: :clubmembers, source: :amitian
has_many :requested_invitations, -> { where(clubmembers: { accepted: false}) }, through: :invitations, source: :club


has_many :notifications , dependent: :destroy

# club members methods
      def invited
      active_invitations | received_invitations
    end

# to call your pending sent or received

    def pending
        pending_invitations | requested_invitations
    end

    def invited?(invited_amitian)
      received_invitations.include?(invited_amitian) ||   active_invitations.include?(invited_amitian)
    end

def pending?(pending_amitian)
pending_invitations.include?(pending_amitian)
end

def requested?(amitian)
requested_invitations.include?(amitian)
  end


end
