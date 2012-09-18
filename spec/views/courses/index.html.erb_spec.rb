require 'spec_helper'

describe "/courses/index.html.erb" do
  include CoursesHelper

  before(:each) do
    assigns[:courses] = [
      stub_model(Course,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(Course,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of courses" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
