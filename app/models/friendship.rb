class Friendship < ActiveRecord::Base
  belongs_to :user, foreign_key: :invitor
  belongs_to :friend, :class_name => "User", foreign_key: :invitee
end
