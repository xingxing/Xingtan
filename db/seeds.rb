# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

SystemSetting.create
User.create(
            :name=>"Confucius",
            :password=>"Confucius_123",
            :student_id=>"0",
            :identity=>"教师"
               )

