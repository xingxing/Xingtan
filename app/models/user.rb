require 'digest/sha2'

class User < ActiveRecord::Base
  validates_presence_of :name, :message => "请输入您的在册姓名"
  validates_presence_of :password,:message => "密码不可以为空"
  
  validates_presence_of :student_id, :on=>:update,:message => "请输入您的学号"
  
  
  validates_uniqueness_of :student_id 
  
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
 
  private
  
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
