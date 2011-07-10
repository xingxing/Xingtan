class SystemSettingsController < ApplicationController
  before_filter :check_permissions

  def edit
    @system_setting = SystemSetting.first
  end

  def update
    @system_setting = SystemSetting.first
    @system_setting.update_attributes(params[:system_setting])
  end
end
