class Amitian < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 acts_as_voter
 has_many :feedbacks
  acts_as_follower
  before_save { self.email = email.downcase }
  ## confessions
has_many :confessions, dependent: :destroy
has_many :confessioncomments, dependent: :destroy
## follow model
has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


has_one :about_amitian , foreign_key: "amitian_id"
has_one :gallery, foreign_key: "amitian_id"
has_many :notifications, dependent: :destroy  

mount_uploader :profilepic , ProfilepicUploader
mount_uploader :cover , CoverUploader

#hotlist model

has_many :active_hotlists, class_name:  "Hotlist",
                                  foreign_key: "hotlister_id",
                                  dependent:   :destroy

has_many :passive_hotlists, class_name:  "Hotlist",
                                   foreign_key: "hotlisted_id",
                                   dependent:   :destroy
  has_many :hotlisting, through: :active_hotlists,  source: :hotlisted
  has_many :hotlisters, through: :passive_hotlists, source: :hotlister

# friendship model

has_many :friendships
has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :amitian
has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :amitian

# club member model
has_many :clubmembers
has_many :eventmembers

# chat model
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  # club model

  has_many :clubs, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :eventposts , dependent: :destroy
  has_many :eventcomments , dependent: :destroy
  has_many :clubposts, dependent: :destroy
  has_many :clubscomments, dependent: :destroy

  
  
   

# to call all your friends

    def friends
      active_friends | received_friends
    end

# to call your pending sent or received

    def pending
        pending_friends | requested_friendships
    end

    def friends?(friend_amitian)
      received_friends.include?(friend_amitian) ||   active_friends.include?(friend_amitian)
    end

def pending?(pending_amitian)
pending_friends.include?(pending_amitian)
end

def requested?(amitian)
requested_friendships.include?(amitian)
  end

  


# validations 
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :fullname , presence: true, length: { minimum: 4, maximum: 16 }  
validates :email , presence: true ,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
 
validates :campus , presence: true
validates :institute , presence: true

def self.amitian_search(search)
if search
  if search.empty?
    where('fullname LIKE ?' , " ")
  else
where('fullname LIKE ?', '%'+search+'%')
end
else
where('fullname LIKE ?' , " ")
end
end

def self.search(search)
if search
    if search.empty?
      where('fullname LIKE ?' , " ")
    else
  where('fullname LIKE ?', '%'+search+'%')
end
else
where('fullname LIKE ?' , " ")
end
end

# Follows a amitian.
  def myfollow(other_amitian)
    following << other_amitian
  end
  # Unfollows a amitian.
  def myunfollow(other_amitian)
    following.delete(other_amitian)
  end

  # Returns true if the current amitian is following the other amitian.
  def myfollowing?(other_amitian)
    following.include?(other_amitian)
end
  # hotlist an amitian

    def hotlistamitian(other_amitian)
      hotlisting << other_amitian
    end

    def removehotlist(other_amitian)
      hotlisting.delete(other_amitian)
    end

    def hotlisting?(other_amitian)
      hotlisting.include?(other_amitian)
    end

#check if a user is online
   def online?
    if current_sign_in_at.present? 
      last_sign_out_at.present? ? current_sign_in_at > last_sign_out_at : true
    else
      false
    end
  end

end
