class Post < ActiveRecord::Base
  attr_accessible :title, :content, :tags_attributes
  
  validates :title, :presence => true
  validates :title, :length => { :minimum => 2 }

  validates :content, :presence => true
  validates :content, :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
