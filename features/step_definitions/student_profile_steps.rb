Given /^: 我已经以颜回的名字登录了$/  do
   params = {
    "name"=> "颜回",
    "password"=>"123456",
    "password_confirmation"=>"123456"
  }
  @user = User.create(params)
  visit login_path
  fill_in '姓名', :with => "颜回"
  fill_in '密码', :with => "123456"
  click_button("登录")
end


When /^: 修改基本信息学号为(\d+)$/ do |student_id|
  visit edit_user_path(@user)
  fill_in '学号',:with => student_id
  click_button("修改")
end

Then /^: 我的基本信息中将会有学号为(\d+)$/ do |student_id|
  visit users_info_by_name_path :name=>"颜回"
  response.should contain(student_id)  
end


Given /^: 我没有登录$/ do

end

When /^: 访问修改id为(\d+)的用户编辑页面$/ do |user_id|
  visit '/users/1/edit'
end

Then /^: 将跳到登录页面，提示请登录$/ do
 response.should contain("请您登录")   
end
