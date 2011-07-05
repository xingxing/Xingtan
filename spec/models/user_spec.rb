require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new(:name=>"颜回",:password=>"123456",:password_confirmation=>"123456")
  end
  
  it "姓名和密码都符合要求应该通过验证" do
    @user.should be_valid
  end
    
  it "姓名为空将不能通过验证" do
    @user.name = nil
    @user.should_not be_valid
  end
  
  it "密码为空不能通过验证" do
    @user.password = nil
    @user.password_confirmation = nil
    @user.should_not be_valid
  end
  
  it "密码和重复密码不一致不能通过验证" do
    @user.password_confirmation = "000000"
    @user.should_not be_valid
  end
end
