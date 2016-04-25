# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
  [ "Mr_Turbo", "Race car driver", "password1", "turbo@example.com"],
  [ "Ms_Rocket", "Rocket Engineer", "password1", "rocket@example.com"],
  [ "Guy_Incognito", "Space Pirate", "password1", "guy@example.com"],
  [ "Marketing_Space_Guy", "Marketing", "password1", "marketing@example.com"],

]

user_list.each do |username, job_title, password, email|
  User.create( username: username, job_title: job_title, password: password, email: email )
end