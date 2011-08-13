class CreateHomeworks < ActiveRecord::Migration
  def self.up
    create_table :homeworks do |t|
      t.integer :topic_id
      t.integer :user_id
      
      t.string  :content_file_name 
      t.string  :content_content_type
      t.integer :content_file_size
      t.datetime :content_updated_at
      
      t.text  :description
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :homeworks
  end
end
