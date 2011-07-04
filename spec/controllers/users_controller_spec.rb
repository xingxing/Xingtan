require 'spec_helper'

describe UsersController do
  describe "POST create" do
    context "当密码和重复密码不相同时" do
      before{
        post :create, {
          "user"=> {
            "name"=>"颜回",
            "password"=>"123456",
            "user_password_again"=>"12345666"
          },
          "commit"=>"注册"}
      }
      it "应该重新渲染注册页面" do
        response.should render_template("new" )
      end
    end
    
    context "当密码和重复密码相同时" do
      it "应该创建用户"
      it "用户的身份应该是学生"
      it "应该重定向填写档案的页面"
      it "设置session"
    end
  end
end
