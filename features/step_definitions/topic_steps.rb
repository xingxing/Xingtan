Given /^: 我访问创建作业题页面$/ do
  visit new_topic_path
end

When /^: 填入作业题相关的信息$/ do
  fill_in "标题",:with=>"郑伯克段于鄢"
  fill_in "作业要求",:with=>"初，郑武公娶于申，曰武姜，生庄公及共叔段。庄公寤生，惊姜氏，故名曰寤生，遂恶之。爱共叔段，欲立之。亟请于武公，公弗许。"
  select "诗",:from=>"所属课程"
  select "2012",:from=>"topic_deadline_1i"
  select "4",:from=>"topic_deadline_2i"
  select "1",:from=>"topic_deadline_3i"
  select "19",:from=>"topic_deadline_4i"
  select "30",:from=>"topic_deadline_5i"
  select "发布",:from=>"作业状态"
  click_button "创建"
end

Then /^: 在作业题列表中会出现这个题目$/ do
  visit topics_path
  response.should contain("郑伯克段于鄢")
end

Given /^: 已经有一项作业叫做 学而时习之$/ do
  Topic.create!(:id=>1,:title=>"学而时习之",:deadline=>Time.now)
end

When /^: 我在作业题列表，点击删除该作业题时$/ do
  visit topics_path
  selenium.click "//a[@id='destroy_1']"
end

Then /^: 会跳出确认信息: 你确定删除学而时习之这道题吗？$/ do
  selenium.is_confirmation_present.should be_true
  selenium.get_confirmation.should eql("你确定删除学而时习之这道题吗？")
end

Then /^: 学而时习之 将不会存在在作业题列表中$/ do
  visit topics_path
  response.should_not contain("学而时习之")
end

When /^: 我在作业题列表，点击编辑该课程时$/ do
  visit topics_path
  selenium.click "//a[@href='/topics/1/edit']"
end

Then /^: 修改作业题的状态为 发布$/ do
  select "发布",:from=>"作业状态"
  click_button "更新"
end

Then /^: 课程显示页面会出现 发布$/ do
  visit topic_path(:id=>1)
  response.should contain("发布")
end
