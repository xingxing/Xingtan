class User < ActiveRecord::Base
   named_scope :students, :conditions => {:identity => "student"}
end
