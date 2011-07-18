class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.integer :course_id
      t.datetime :deadline
      t.string :state,:deafualt=>"待发布"
        
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
