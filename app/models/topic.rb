class Topic < ActiveRecord::Base
  named_scope :published,:conditions =>{:state=>"发布"}
  
  belongs_to :course

  STATE = %w{ 待发布 发布 关闭}

end
