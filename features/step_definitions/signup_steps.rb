Given /^: 我的名字叫颜回$/ do
  
end

When /^: 注册成为学生$/ do
  visit signup_path
  fill_in "user_name" , :with => "颜回"
  fill_in "user_password" , :with => "123456"
  fill_in "user_password_again" , :with => "123456"
  click_button "注册"
end

Then /^: 我的身份应该是学生$/ do
  visit users_path
  response.should contain("1名学生" )
end

Then /^: 我的学生姓名是颜回$/ do
  visit users_path
  response.should contain("颜回" )  
end
