class Post < ActiveRecord::Base
  attr_accessible :title
  validates :title, presence: true
  validates :title, length: {minimum: 2}
end
