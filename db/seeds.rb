# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Ingredient.delete_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient =JSON.parse(open(url).read)

ingredient["drinks"].each_index do |i|
  item = ingredient["drinks"][i]['strIngredient1']
  Ingredient.create(name: item)
end

url = "http://imbibemagazine.com/wp-content/uploads/2018/02/the-ruse-julep-vertical-crdt-julie-soefer-web.jpeg"

cocktail = Cocktail.new(name: "The Ruse")
cocktail.remote_photo_url = url
cocktail.save
