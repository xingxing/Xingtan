class Course < ActiveRecord::Base
  validates_presence_of :name, :message => "请输入课程名称"
  validates_uniqueness_of :name,:message => "此课程已经存在"
  has_many :topics
end
