# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create(:email => 'user@mailinator.com', :name => 'Spy', :password => 'qweqwe', :password_confirmation => 'qweqwe', :active => true)
user.projects.create(:name => "Time Manager", :description => "It's project for fun", :owner => user)
