require 'spec_helper'

describe "/courses/edit.html.erb" do
  include CoursesHelper

  before(:each) do
    assigns[:course] = @course = stub_model(Course,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders the edit course form" do
    render

    response.should have_tag("form[action=#{course_path(@course)}][method=post]") do
      with_tag('input#course_name[name=?]', "course[name]")
      with_tag('textarea#course_description[name=?]', "course[description]")
    end
  end
end
