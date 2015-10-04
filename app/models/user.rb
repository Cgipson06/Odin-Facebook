class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
  has_many :posts, foreign_key: :author
  has_one :end_user, foreign_key: :user_id
  has_many :friendships, foreign_key: :invitee
  has_many :friend_requests, foreign_key: :recipient_id
  has_many :comments

end