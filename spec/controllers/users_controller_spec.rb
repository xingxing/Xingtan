require 'spec_helper'

describe UsersController do

  describe "POST authenticate" do
    context "用户登录成功" do
      before(:each) do
        @user = mock("User",:id =>23,:name=>"名")
        User.stub!(:authenticate).and_return(@user)
      end
      
      it "将会重定向到用户中心" do
        post :authenticate,{:user=>{:name=>"123",:password=>"123"}}     
        response.should redirect_to(center_user_path(:id=>23))
      end
      
      it "设置session current_user 为用户的id" do
        post :authenticate,{:user=>{:name=>"123",:password=>"123"}}
        session[:current_user].should eql(23)
      end
    end
  
    context "用户登录不成功" do
      before(:each) do
        User.stub!(:authenticate).and_return(nil) 
      end
      
      it "应该重定向到登录页面" do
        post :authenticate,{:user=>{:name=>"123",:password=>"123"}}     
        response.should redirect_to(login_path) 
      end
      
      it "不应该设置 session current_user" do
        post :authenticate,{:user=>{:name=>"123",:password=>"123"}}
        session[:current_user].should eql(nil)
      end
     
      it "应该设置flash通知:用户名或者密码错误" do
        post :authenticate,{:user=>{:name=>"123",:password=>"123"}}
        flash[:notice].should eql("用户名或者密码错误")
      end
    end
  end


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
