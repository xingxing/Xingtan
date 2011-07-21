class Homework < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  
  has_attached_file :content
end
