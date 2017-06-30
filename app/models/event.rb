class Event < ApplicationRecord

	belongs_to :club
	belongs_to :amitian
	 mount_uploader :event_themepic , EventThemepicUploader
	 validates :eventtheme , presence: true, length: { minimum: 2, maximum: 50 } 
     validates :location , presence: true
     validates :department , presence: true
     validates :start , presence: true
     #validates :tags , presence: true
     validates :endtime , presence: true
     validates :description , presence: true, length: { minimum: 5, maximum: 1000 } 
     validate :validate_timmings
     acts_as_followable
      has_many :eventposts, dependent: :destroy
      has_many :notifications , dependent: :destroy
       	def validate_timmings
       		if start != nil && endtime != nil
       		if start  > endtime || start < Time.now
       			  flash[:notice] = "Wrong Start or End time"
       		end
       	end
       	end

end
