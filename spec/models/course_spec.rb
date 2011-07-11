require 'spec_helper'

describe Course do
  before(:each) do
    @user = Course.new(:name=>"春秋")
  end
 
  it "具有课程名称，就通过验证" do
    @user.should be_valid
  end
  
  it "没有课程名称，就不通过验证" do
    @user.name = nil 
    @user.should_not be_valid
  end
end
