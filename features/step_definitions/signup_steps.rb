Given /^: 我的名字叫颜回$/ do
  
end

When /^: 注册成为学生$/ do
  visit signup_path
  fill_in "user_name" , :with => "颜回"
  fill_in "user_password" , :with => "123456"
  fill_in "user_password_confirmation" , :with => "123456"
  click_button "注册"
end

Then /^: 我的身份应该是注册用户$/ do
  visit users_info_by_name_path :name=>"颜回"
  response.should contain("user" )  
end

Then /^: 我的姓名是颜回$/ do
  visit users_info_by_name_path :name=>"颜回"
  response.should contain("颜回" ) 
end
