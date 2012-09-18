class Homework < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  
  has_attached_file :content

  before_update :rename_file
 
  def content_file_size_by_human
    if content_file_size
      units = %w{B KB MB GB TB}
      e = (Math.log(content_file_size.to_i)/Math.log(1024)).floor
      s = "%.2f" % (content_file_size.to_f / 1024**e)
      s.sub(/\.?0*$/, units[e])
    else
      "无上传文件" 
    end
  end
 
  private
  
  def rename_file
    if content_file_name
      extension = File.extname(content_file_name).downcase
      self.content.instance_write(:file_name, "#{self.topic.title}-#{self.user.name}#{extension}")    
    end
  end
end
