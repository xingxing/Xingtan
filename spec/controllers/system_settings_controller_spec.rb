require 'spec_helper'

describe SystemSettingsController do

  describe "PUT update" do
   let(:current_user){mock_model(User)}
   let(:system_setting){mock_model(SystemSetting,:id=>1).as_null_object} 
    
    before do
      controller.stub!(:current_user).and_return(current_user) 
      SystemSetting.stub!(:first).and_return(system_setting)
    end
  
    context "如果当前用户是教师" do
      before{ current_user.stub!(:identity).and_return("教师") }
      
      it "系统设置应该被更新" do
        system_setting.should_receive(:update_attributes)
        put :update
      end
      
      context "如果更新成功" do
        it "应该重定向到用户中心页面" do
          system_setting.sub!(:update_attributes).and_return(true)
          put :update
          response.should redirect_to(center_user_path(current_user))
        end
      end
    end
    
    context "如果当前用户是学生" do
      before{ current_user.stub!(:identity).and_return("学生") }
     
      it "应该重定向到用户中心" do
        put :update
        response.should redirect_to(center_user_path(current_user))
      end
     
      it "flash消息会提示:抱歉，您没有相关权限" do
        put :update
        flash[:notice].should == "抱歉，您没有相关权限"
      end
    end
  end
end
