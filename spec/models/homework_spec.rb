require 'spec_helper'

describe Homework do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Homework.create!(@valid_attributes)
  end
end
