# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create(:email => 'spy-a@ya.ru', :name => 'Alexey Kisel', :password => '123123', :password_confirmation => '123123', :active => true)
user.projects.create(:name => "Time Manager", :description => "It's project for track work time and make reports based on it", :owner => user)
