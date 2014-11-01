class Tag < ActiveRecord::Base
  has_many :tag_assignments
  has_many :posts, :through => :tag_assignments
end