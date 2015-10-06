class FriendRequest < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: {scope: :recipient_id, message: "only one friendrequest allowed"}
end
