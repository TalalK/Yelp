# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.destroy_all
Review.destroy_all

maze  = Restaurant.create(name: 'Maze')
maze.reviews.create(rating: 1, thoughts: 'OK')
maze.reviews.create(rating: 2, thoughts: 'Bad')
maze.reviews.create(rating: 3, thoughts: 'Meh')
maze.reviews.create(rating: 4, thoughts: 'Good')
maze.reviews.create(rating: 5, thoughts: 'Great')

kfc  = Restaurant.create(name: 'KFC')
kfc.reviews.create(rating: 1, thoughts: 'Very OK')
kfc.reviews.create(rating: 2, thoughts: 'Very Bad')
kfc.reviews.create(rating: 3, thoughts: 'Very Meh')
kfc.reviews.create(rating: 4, thoughts: 'Very Good')
kfc.reviews.create(rating: 5, thoughts: 'Very Great')

itsu  = Restaurant.create(name: 'Itsu')
itsu.reviews.create(rating: 1, thoughts: 'MUCH OK')
itsu.reviews.create(rating: 2, thoughts: 'MUCH Bad')
itsu.reviews.create(rating: 3, thoughts: 'MUCH Meh')
itsu.reviews.create(rating: 4, thoughts: 'MUCH Good')
itsu.reviews.create(rating: 5, thoughts: 'MUCH Great')

wasabi  = Restaurant.create(name: 'Wasabi')
wasabi.reviews.create(rating: 1, thoughts: 'Nori')
wasabi.reviews.create(rating: 2, thoughts: 'Tuna')
wasabi.reviews.create(rating: 3, thoughts: 'Sashimi')
wasabi.reviews.create(rating: 4, thoughts: 'Salmon')
wasabi.reviews.create(rating: 5, thoughts: 'MOCHI!')

hakkasan  = Restaurant.create(name: 'Hakkasan')
hakkasan.reviews.create(rating: 1, thoughts: 'Hakkasan OK')
hakkasan.reviews.create(rating: 2, thoughts: 'Hakkasan Bad')
hakkasan.reviews.create(rating: 3, thoughts: 'Hakkasan Meh')
hakkasan.reviews.create(rating: 4, thoughts: 'Hakkasan Good')
hakkasan.reviews.create(rating: 5, thoughts: 'Hakkasan Great')




