class Friendship < ActiveRecord::Base
  belongs_to :user, foreign_key: :invitor
  belongs_to :friend, :class_name => "User", foreign_key: :invitee
  
  validates :invitor, uniqueness: {scope: :invitee, message: "Friendship already exists"}
end
