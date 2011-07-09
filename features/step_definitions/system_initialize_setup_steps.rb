Given /^: 系统没有开放注册$/ do
  SystemSeting.create!
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
  SystemSeting.create!(:open_registration=>true)
end

Then /^: 会跳到注册页面去$/ do
  response.should have_xpath(".//input[@id='user_name' and @type='text']")
  response.should have_xpath(".//input[@id='user_password' and @type='password']")
  response.should have_xpath(".//input[@id='user_password_confirmation' and @type='password']")  
  response.should have_xpath(".//input[@value='注册' and @type='submit']")    
end
