class Post < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :group
end
