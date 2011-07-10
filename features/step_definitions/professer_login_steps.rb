Given /^: 我是教师用户，第一次登录网站$/ do
  User.create(:name=>"Confucius",
                  :password =>"Confucius_123",
                  :password_confirmation=>"Confucius_123",
                  :identity => "教师"
               )
end

When /^: 输入正确的用户名和密码$/ do
  visit login_path 
  fill_in "姓名",:with=>"Confucius"
  fill_in "密码",:with=>"Confucius_123"
  click_button "登录"
end

Then /^: 你会看到：你好，Confucius$/ do
  response.should contain("你好，Confucius") 
end

Then /^: 你会看到修改系统设置的菜单项$/ do
  response.should have_xpath(".//a[@href='/system_settings/1/edit']")
  response.should contain("修改系统设置")
end


Given /^: 我不是教师用户$/ do
  
end

Then /^: 重新渲染登录页面$/ do
  current_url.should =~ /login/
end
