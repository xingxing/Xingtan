require 'spec_helper'

describe "/topics/show.html.erb" do
  include TopicsHelper
  before(:each) do
    assigns[:topic] = @topic = stub_model(Topic)
  end

  it "renders attributes in <p>" do
    render
  end
end
