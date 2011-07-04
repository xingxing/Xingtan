require 'spec_helper'

describe UsersController do
  describe "POST create" do

    before do
      @student = User.new
      User.stub!(:new).and_return @student
    end
  
    it "应该创建用户" do
      @student.should_receive(:save)             
      post :create
    end
      
    
    
    context "当保存不成功时" do
      before do
        @student.stub!(:save).and_return false
      end 
      
      it "应该重新渲染注册页面" do
        post :create
        response.should render_template("new" )
      end
    end
    
    context "当保存成功时" do
      before do
        @student.stub!(:save).and_return @student
        @student.stub!(:id).and_return(1)
      end
       
      it "应该重定向填写档案的页面" do
        post :create
        response.should redirect_to(:action => "edit",:id=>1 )
      end
      
      it "设置session" do
        post :create
        session[:current_user].should eql(1) 
      end
    end
  end
end
