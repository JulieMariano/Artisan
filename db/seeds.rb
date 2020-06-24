# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 0 .Clean DB
Item.destroy_all
Category.destroy_all
User.destroy_all

# 1. CATEGORIES
carpets = Category.create(name: "Carpets")
manta = Category.create(name: "Manta")
lighting = Category.create(name: "Lighting")
decoration_for_walls = Category.create(name: "Decoration for walls")
decoration_for_kids = Category.create(name: "Decoration for kids")
ceramics = Category.create(name: "Ceramics")
accessories = Category.create(name: "Accessories")

# 2. ITEMS
# 2.1. CARPETS ITEMS
  ["Manjeet", "Agrippa", "Wen", "Maayan", "Jyoti"].each do |name|
    new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
    new_item.category = carpets
    new_item.save
    puts "Created new carpet named #{name}."
  end

# 2.2. MANTA
  ["Mankeat", "Agoa", "Caheei", "Mowih"].each do |name|
    new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price:rand(0..300))
    new_item.category = manta
    new_item.save
    puts "Created new manta named #{name}."
  end

# 2.3. LIGHTING
  ["Jae", "Borna", "Cahyo"].each do |name|
      new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
      new_item.category = lighting
      new_item.save
      puts "Created new lighting named #{name}."
  end

# 2.4. DECORATION FOR WALLS
  ["Aviyah", "Fatsani", "Dana", "Noy", "Cahaya", "Sung", "Raine"].each do |name|
      new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
      new_item.category = decoration_for_walls
      new_item.save
      puts "Created new wall named #{name}."
  end

# 2.5. DECORATION FOR KIDS
  ["Lua", "Mairia", "Neel", "Gaya"].each do |name|
      new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
      new_item.category = decoration_for_kids
      new_item.save
      puts "Created new decoration for kids named #{name}."
  end

# 2.6. CERAMICS
  ["Kraaf", "Preina", "Teef", "Griz", "Kaly"].each do |name|
      new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
      new_item.category = ceramics
      new_item.save
      puts "Created new ceramic named #{name}."
  end

# 2.7. ACCESSORIES
  ["Silvyana", "Caeeopi", "Khola"].each do |name|
      new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
      new_item.category = accessories
      new_item.save
      puts "Created new acessory named #{name}."
  end

  # 3. USERS
  laure = User.create(name: "laure", email: "laure@gmail.com", password: "123456", is_admin: true)