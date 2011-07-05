Given /^: 我是注册用户子路，我访问登录页面$/ do
   params = {
    "name"=> "子路",
    "password"=>"password",
    "password_confirmation"=>"password"
  }
  @user = User.create(params)
end

When /^:  用姓名和密码登录$/ do
  visit login_path
  fill_in 'Login', :with => "子路"
  fill_in 'Password', :with => "password"
  click_button("登录")
end

Then /^: 页面上应该出现你好，子路$/ do
  response.should contain("你好，子路" )
end
