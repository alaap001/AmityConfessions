class Event < ApplicationRecord

	belongs_to :club
	belongs_to :amitian
	 mount_uploader :event_themepic , EventThemepicUploader
	 validates :eventtheme , presence: true, length: { minimum: 2, maximum: 50 } 
     validates :location , presence: true
     validates :department , presence: true
     validates :start , presence: true
     validates :endtime , presence: true
     validates :description , presence: true, length: { minimum: 5, maximum: 1000 } 
     validate :validate_timmings

     has_many :eventmembers
     has_many :active_interests, class_name:  "Eventmember",
                                  foreign_key: "amitian_id",
                                  dependent:   :destroy
     has_many :passive_interests, class_name:  "Eventmember",
                                   foreign_key: "event_id",
                                   dependent:   :destroy
      has_many :eventposts, dependent: :destroy
      has_many :notifications , dependent: :destroy
      has_many :eventfollowing, through: :active_interests,  source: :event
      has_many :eventfollowers, through: :passive_interests, source: :amitian

       	def validate_timmings
       		if start != nil && endtime != nil
       		if start  > endtime || start < Time.now
       			  errors[:base] << "Start Time must be less than End Time"
       		end
       	end
       	end


  def eventfollow(other_amitian)
    eventfollowing << other_amitian
  end
  # Unfollows a amitian.
  def unfollow(other_amitian)
    eventfollowing.delete(other_amitian)
  end

  # Returns true if the current amitian is following the other amitian.
  def following?(other_amitian)
    eventfollowing.include?(other_amitian)
end
end
