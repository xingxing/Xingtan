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
  fill_in '姓名', :with => "子路"
  fill_in '密码', :with => "password"
  click_button("登录")
end

Then /^: 页面上应该出现你好，子路$/ do
  response.should contain("你好，子路" )
end


Given /^: 我不是注册用户$/ do

end

When /^:  用错误的姓名和密码登录$/ do
 visit login_path
  fill_in '姓名', :with => "123"
  fill_in '密码', :with => "123"
  click_button("登录")
end

Then /^:  重新渲染登录页面$/ do
  current_url.should =~ /login/
 end

Then /^: 你会看到用户名或者密码错误的提示$/ do
  response.should contain("用户名或者密码错误" )
end
