# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
topics = ["Travel", "Education", "Dance", "Coding", "Art", "Fashion", "Family", "Children", "Food", "Health"]
user = User.new
user.email = "gaosong1989@uchicago.edu"
user.password = "123456"
user.password_confirmation = "123456"
user.name = "Admin"
user.gender = "Male"
user.age = 24
user.country = "US"
user.zip = 60637
user.save
$i = 0
while $i < topics.count
  Topic.create name: topics[$i]
  $i += 1
end
