class Homework < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  
  has_attached_file :content

  before_create :rename_file
  
  private
  
  def rename_file
    extension = File.extname(content_file_name).downcase
    self.content.instance_write(:file_name, "#{self.topic.title}-#{self.user.name}#{extension}")    
  end
end
