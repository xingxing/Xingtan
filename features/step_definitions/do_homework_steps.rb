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
