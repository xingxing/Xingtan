Given /^: 我访问诗的发布作业页面$/ do
  visit published_topics_path
end

When /^: 我选择 诗 这个课程$/ do
  click_link "诗"
end

Then /^: 学而时习之 将出现载页面中$/ do
  response.should contain("学而时习之")
end
