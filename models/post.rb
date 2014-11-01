class Post < ActiveRecord::Base
  has_many :tag_assignments
  has_many :tags, :through => :tag_assignments
end