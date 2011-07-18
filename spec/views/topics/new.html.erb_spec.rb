require 'spec_helper'

describe "/topics/new.html.erb" do
  include TopicsHelper

  before(:each) do
    assigns[:topic] = stub_model(Topic,
      :new_record? => true
    )
  end

  it "renders new topic form" do
    render

    response.should have_tag("form[action=?][method=post]", topics_path) do
    end
  end
end
