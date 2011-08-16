class AddScoreForHomeworks < ActiveRecord::Migration
  def self.up
    add_column :homeworks,:score,:integer
  end

  def self.down
    remove_column :homeworks,:score
  end
end
