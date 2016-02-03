# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create(name: 'Item 1', description: { age: 20, city: 'Moscow', professtion: 'IT' })
Item.create(name: 'Item 2', description: { age: 25, city: 'New York', professtion: 'Cooker' })
