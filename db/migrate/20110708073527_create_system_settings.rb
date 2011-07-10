class CreateSystemSettings < ActiveRecord::Migration
  def self.up
    create_table :system_settings do |t|
      t.boolean :open_registration,:default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :system_settings
  end
end
