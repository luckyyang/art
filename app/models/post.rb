class Post < ActiveRecord::Base
  attr_accessible :title, :content
  
  validates :title, :presence => true
  validates :title, :length => { :minimum => 2 }

  validates :content, :presence => true
  validates :content, :length => { :minimum => 5 }
end
