class Group < ActiveRecord::Base
  validates :title, presence: true

  has_many :posts
  belongs_to :owner, class_name: "User", foreign_key: :user_id

end
