# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = User.new(name: 'admin', email: 'admin@gmail.com', password: 'password', password_confirmation: 'password')
a.role = :admin
a.save!
u = User.create!(name: 'user', email: 'user@gmail.com', password: 'password', password_confirmation: 'password')
u.role = :user
u.save
