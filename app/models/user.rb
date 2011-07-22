require 'digest/sha2'

class User < ActiveRecord::Base
  validates_presence_of :name, :message => "请输入您的在册姓名"
  validates_uniqueness_of :name, :message => "已经有和您同名的同学注册了，请在您的名字后加入下划线+任意数字（如：颜回_1）"
  validates_presence_of :password,:on=>:create,:message => "密码不可以为空"
  
  validates_presence_of :student_id, :on=>:update,:message => "请输入您的学号"
  
  
  validates_uniqueness_of :student_id,:on => :update 
  
  named_scope :students, :conditions => {:identity => "student"}
 
  validates_confirmation_of :password,:message => "您输入的密码不一致"
  attr_accessor :password_confirmation
  attr_reader :password

  class << self
    def authenticate(name, password)
      if user = find_by_name(name)
        if user.hashed_password == encrypt_password(password, user.salt)
          user
        end
      end
    end

    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "wibble" + salt)
    end
  end
  
  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end
 

  # 学生是否提交过作业?
  # @param[Topic] 作业题
  def has_submitted? topic
    Homework.find_by_topic_id_and_user_id(topic[:id],self[:id]) ? true : false
  end


  private
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
