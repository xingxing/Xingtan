class Topic < ActiveRecord::Base
  belongs_to :course

  STATE = %w{ 待发布 发布 关闭}
  
end
