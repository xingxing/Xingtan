class CreateSystemSetings < ActiveRecord::Migration
  def self.up
    create_table :system_setings do |t|
      t.boolean :open_registration,:default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :system_setings
  end
end
