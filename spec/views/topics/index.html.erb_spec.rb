require 'spec_helper'

describe "/topics/index.html.erb" do
  include TopicsHelper

  before(:each) do
    assigns[:topics] = [
      stub_model(Topic),
      stub_model(Topic)
    ]
  end

  it "renders a list of topics" do
    render
  end
end
