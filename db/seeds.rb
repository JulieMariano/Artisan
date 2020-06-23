# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["Ceramics", "Lighting", "Carpets"].each do |fake_category|
  new_category = Category.new(name: fake_category)
  new_category.save
  puts "Created the category #{fake_category}."

  ["Small", "Medium", "Large"].each do |fake_item|
    new_item = Item.new(name: fake_item, description: "describe it", price: 12)
    new_item.category = new_category
    new_item.save
    puts "Created the item #{fake_item} for the category #{fake_category}."
  end  
end

user_new = User.new(name: "Edgar", email: "edgar@hotmail.com", password: "123456")
user_new.save
puts "Created a user!"
