# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => CONFIG[:name], :email =>CONFIG[:email], :password => CONFIG[:password], :password_confirmation => CONFIG[:password_confirmation]
puts 'user: ' << user.name
user.add_role :admin

#CONFIG[:name]
#CONFIG[:password]
#CONFIG[:password_confirmation]
#CONFIG[:email]

