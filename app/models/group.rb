class Group < ActiveRecord::Base
  validates :title, presence: true
end
