class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :author
  has_many :comments
  has_many :likes
  has_many :likers, through: :likes, :source => "user"
end
