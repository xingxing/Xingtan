require 'spec_helper'

describe "/courses/show.html.erb" do
  include CoursesHelper
  before(:each) do
    assigns[:course] = @course = stub_model(Course,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end
