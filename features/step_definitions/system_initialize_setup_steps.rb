Given /^: 系统没有开放注册$/ do
  SystemSetting.create!
end

When /^: 我访问注册页面$/ do
  visit signup_path
end

Then /^: 会跳到登录页面提示:抱歉，本系统尚未开放注册$/ do
  response.should have_xpath(".//input[@id='user_name' and @type='text']")
  response.should have_xpath(".//input[@id='user_password' and @type='password']")
  response.should have_xpath(".//input[@value='登录' and @type='submit']")  
  response.should contain("抱歉，本系统尚未开放注册")
end

Given /^: 系统已经开放注册$/ do
  SystemSetting.create!(:open_registration=>true)
end

Then /^: 会跳到注册页面去$/ do
  response.should have_xpath(".//input[@id='user_name' and @type='text']")
  response.should have_xpath(".//input[@id='user_password' and @type='password']")
  response.should have_xpath(".//input[@id='user_password_confirmation' and @type='password']")  
  response.should have_xpath(".//input[@value='注册' and @type='submit']")    
end


Given /^: 教师已经登录了系统$/ do
  SystemSetting.create!
  User.create(:name=>"Confucius",
                  :password =>"Confucius_123",
                  :password_confirmation=>"Confucius_123",
                  :identity => "教师"
               )
  visit login_path 
  fill_in "姓名",:with=>"Confucius"
  fill_in "密码",:with=>"Confucius_123"
  click_button "登录"
end

When /^: 访问修改系统设置的页面$/ do
  visit edit_system_setting_path(:id=>1)
end

Then /^: 会跳到修改系统设置的页面$/ do
  response.should contain("是否开放注册:")
  response.should have_xpath(".//input[@value='true' and @type='radio' and @name='system_setting[open_registration]']")
  response.should have_xpath(".//input[@value='false' and @type='radio' and @name='system_setting[open_registration]']")
  response.should have_xpath(".//input[@value='修改' and @type='submit']")
end

Given /^: 学生已经登录了系统$/ do
  SystemSetting.create!
  User.create(:name=>"子路",
                  :password =>"123456",
                  :password_confirmation=>"123456",
                  :identity => "学生"
               )
  visit login_path 
  fill_in "姓名",:with=>"子路"
  fill_in "密码",:with=>"123456"
  click_button "登录"
end

Then /^: 会跳到用户中心页面$/ do
   current_url.should =~ /center/
end

Then /^: 提示 抱歉，您没有相关权限$/ do
  response.should contain("抱歉，您没有相关权限")
end
