Given /^: 我访问创建课程页面$/ do
  visit new_course_path
end


When /^: 创建课程"([^"]*)"$/ do |course_name|
  fill_in "课程名称",:with=>course_name
  click_button "创建"
end

Then /^: 在课程列表中会出现"([^"]*)"$/ do |course_name|
  response.should contain(course_name)
end

Given /^: 已经有一门课程 诗$/ do
  Course.create(:id=>1,:name=>"诗")
end

When /^: 我在课程列表，点击删除该课程时$/ do
  visit courses_path
  selenium.click "//a[@id='destroy_1']"
end

Then /^: 会跳出确认信息: 你确定删除诗这门课吗？$/ do
  selenium.is_confirmation_present.should be_true
  selenium.get_confirmation.should eql("你确定删除诗这门课吗？")
end

Then /^: 点击确认$/ do
  selenium.choose_ok_on_next_confirmation 
end

Then /^: 诗将不会存在在课程列表中$/ do
  visit courses_path
  response.should_not contain("诗")
end

When /^: 我在课程列表，点击编辑该课程时$/ do
  visit courses_path
  selenium.click "//a[@href='/courses/1/edit']"  
end

Then /^: 跳到编辑页面$/ do
  current_url.should =~ /edit/
end

Then /^: 修改课程简介为 中国最古老的文献之一$/ do
  fill_in "课程简介",:with=>"中国最古老的文献之一"
  click_button "更新"
end

Then /^: 课程显示页面会出现 中国最古老的文献之一$/ do
  visit course_path(:id=>1)
  response.should contain("中国最古老的文献之一")
end
