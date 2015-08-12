# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_list = [
  [ "Fitness", "healthy" ],
  [ "Nutrition", "healthy" ],
  [ "Business", "wealthy" ],
  [ "Investing", "wealthy" ],
  [ "Philosophy", "wise" ],
  [ "Science", "wise" ],
  [ "Culture", "wise" ],
  [ "Sociology", "wise" ],
  [ "Politics", "wise" ],
]

category_list.each do |name, parent|
  Category.create( name: name, parent: parent )
end


