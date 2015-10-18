class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
        
  has_many :posts, foreign_key: :author
  has_one :end_user, foreign_key: :user_id
  has_many :friendships, foreign_key: :invitor
  has_many :friends, through: :friendships, foreign_key: :invitor
  has_many :friend_requests, foreign_key: :recipient_id
  has_many :pending_friend_requests, through: :friend_requests, :foreign_key => user_id
  has_many :comments
  has_many :likes
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", tiny: "40x40>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  
  
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image
      user.save!
    
  end
end


def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end