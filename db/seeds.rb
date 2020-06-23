# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    ["Manjeet", "Agrippa", "Wen", "Maayan", "Jyoti"].each do |carpet_name|
        new_item = Item.create(name: carpet_name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
        new_item.category = carpets
    end

  # 2.2. MANTA
    ivory = Item.create(name: "Ivory", description: "Give your home a vibrant, coulourful and creative touch !", price:rand(0..300))
    ivory.category = manta

  # 2.3. LIGHTING
    ["Jae", "Borna", "Cahyo"].each do |lighting_name|
        new_item = Item.create(name: lighting_name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
        new_item.category = lighting
    end

  # 2.4. DECORATION FOR WALLS
    ["Aviyah", "Fatsani", "Dana", "Noy", "Cahaya", "Sung", "Raine"].each do |wall_name|
        new_item = Item.create(name: wall_name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
        new_item.category = decoration_for_walls
    end

  # 2.5. DECORATION FOR KIDS
    ["Lua", "Mairia", "Neel", "Gaya"].each do |kid_name|
        new_item = Item.create(name: kid_name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
        new_item.category = decoration_for_kids
    end

  # 2.6. CERAMICS
    ["Kraaf", "Preina", "Teef", "Griz", "Kaly"].each do |ceramic|
        new_item = Item.create(name: ceramic, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
        new_item.category = ceramics
    end

  # 2.7. ACCESSORIES
    ["Silvyana", "Caeeopi", "Khola"].each do |accessory|
        new_item = Item.create(name: accessory, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(0..300))
        new_item.category = accessories
    end
  
