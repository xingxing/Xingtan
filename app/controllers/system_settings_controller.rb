class SystemSettingsController < ApplicationController
  before_filter :check_permissions

  def edit
    @system_setting = SystemSetting.first
  end

  def update
    @system_setting = SystemSetting.first
    if @system_setting.update_attributes(params[:system_setting])
      redirect_to center_user_path(current_user)
    end
  end
end
