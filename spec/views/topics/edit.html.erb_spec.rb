require 'spec_helper'

describe "/topics/edit.html.erb" do
  include TopicsHelper

  before(:each) do
    assigns[:topic] = @topic = stub_model(Topic,
      :new_record? => false
    )
  end

  it "renders the edit topic form" do
    render

    response.should have_tag("form[action=#{topic_path(@topic)}][method=post]") do
    end
  end
end
