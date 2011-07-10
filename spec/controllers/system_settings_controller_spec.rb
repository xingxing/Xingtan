require 'spec_helper'

describe SystemSettingsController do

  describe "PUT update" do
    before do
      @system_setting = mock_model(SystemSetting,:id=>1)
      SystemSetting.stub!(:first).and_return(@system_setting)
    end
  end
end
