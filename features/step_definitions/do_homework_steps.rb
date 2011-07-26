Given /^: 我访问发布作业页面$/ do
  visit published_topics_path
end

When /^: 我选择 诗 这个课程$/ do
  click_link "诗"
end

Then /^: 学而时习之 将出现载页面中$/ do
  response.should contain("学而时习之")
end

When /^: 我选择 学而时习之 这门功课的 上传作业$/ do
  click_link "上传作业"
end

Then /^: 应该跳到上传作业页面$/ do
  current_url.should =~ /topics\/\d+\/homeworks\/new/
end

When /^: 上传文件$/ do
  attach_file '作业文件',"#{Rails.root}/spec/fixtures/论语.doc"
  click_button "提交"
end

Then /^: 发布作业页面上应该显示 已交付$/ do
  visit published_topics_path
  response.should contain("已交付")
end

Given /^: 我已经上传了一项作业$/ do
  homework = Homework.new
  homework.user = User.first
  homework.topic = Topic.first
  homework.save!
end

Then /^: 我访问我上传的作业页面，点击修改作业$/ do
  visit user_homeworks_path(:user_id=>1)
  click_link "修改"
end

When /^: 重新上传作业$/ do
  attach_file '作业文件',"#{Rails.root}/spec/fixtures/论语.doc"
  click_button "提交"
end

Then  /^: 发布作业页面上应该显示 更新时间为上传时间$/ do
  visit user_homeworks_path(:user_id=>1)
  response.should contain("12.5KB")
end
