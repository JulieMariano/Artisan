# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"

# 1. Clean DB
Item.destroy_all
Category.destroy_all
User.destroy_all

# 2. Categories
carpets = Category.create(name: "Carpets")
mantas = Category.create(name: "Manta")
lighting = Category.create(name: "Lighting")
ceramics = Category.create(name: "Ceramics")
accessories = Category.create(name: "Accessories")
walls_decoration = Category.create(name: "Decoration for walls")
kids_decoration = Category.create(name: "Decoration for kids")

# 3. Items

# Carpets
num = 375560
8.times do
  name = Faker::JapaneseMedia::OnePiece.character
  file = URI.open("https://d25tp5yt5ghnv4.cloudfront.net/image/desk_pdp_zoom/#{num}")
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(100..300))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = carpets
  new_item.save
  num += 1
  puts "Created new carpet named #{name}."
end

# Mantas
['https://www.noticiasmagazine.pt/files/2015/01/nm1184_mantas02.jpg',
'https://margaridaferreira.pt/conteudos/uploads/2019/02/mantas-tear.jpg',
'https://margaridaferreira.pt/conteudos/uploads/2019/02/mantas-capa-610x343.jpg',
'https://margaridaferreira.pt/conteudos/uploads/2019/02/mantas-mizete.jpg',
'https://margaridaferreira.pt/conteudos/uploads/2019/02/mantas-da-vida.jpg',
'https://4.bp.blogspot.com/-eWlWzaP_13I/WJPJdcBzL9I/AAAAAAAACSE/HJNhZ9mXaA0F3B10e-gUUK6tziNC1SRMgCLcB/s1600/Manta%2BAlentejana-8.jpg',
'https://3.bp.blogspot.com/-Xt0-Ejzrm1A/WJO5ufu6e4I/AAAAAAAACRk/5sFh7xqWOSkbrH-ZLGLHx_JzF3NH6BrpgCEw/s1600/Mizette_pic3.jpg',
'https://3.bp.blogspot.com/-ELe7gro6xP0/WJO5pjs2GKI/AAAAAAAACRk/vQN3wqotXIgCNtY3A3-j4o8g9338YvLlACEw/s1600/Manta%2BAlentejana-7.jpg'].each do |url|
  name = Faker::JapaneseMedia::DragonBall.character
  puts url
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price:rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = mantas
  new_item.save
  puts "Created new manta named #{name}."
end

#Lighting items
['https://cdn.shopify.com/s/files/1/0117/0309/1264/products/Paralelepipedo_madeira.jpg?v=1554127139',
'https://jinjaritual.com/wp-content/uploads/2019/10/Entrelacados-lamp-at-Jinja-stand_MO19-768x944.jpg',
'https://cdn.shopify.com/s/files/1/0117/0309/1264/products/Paralelepipedo_betao.jpg?v=1554127064',
'https://mood.sapo.pt/wp-content/uploads/2029/09/Musgo-design.jpg',
'https://mood.sapo.pt/wp-content/uploads/2029/09/Musgo-Design1.jpg',
'https://www.vogue.pt/media/gallery/medium/Musgo%20Produto3.jpg',
'https://www.vogue.pt/media/gallery/medium/TexMB%20D61-5160-@Sebasti%C3%A3o%20Correia%20de%20Campos.jpg',
'https://www.vogue.pt/media/gallery/medium/paperfurniture_ambiente.jpg'].each do |url|
  name = Faker::JapaneseMedia::SwordArtOnline.game_name
  puts url
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = lighting
  new_item.save
  puts "Created new lighting item named #{name}."
end

# Ceramics
['https://www.vogue.pt/media/gallery/medium/Hibridae.jpg',
'http://www.margaridamf.com/files/gimgs/39_39_spoon-cup.jpg',
'http://www.margaridamf.com/files/gimgs/40_40_espresso2.jpg',
'http://www.margaridamf.com/files/gimgs/1_home.jpg',
'http://www.margaridamf.com/files/gimgs/53_53_monogramasas.jpg',
'http://www.margaridamf.com/files/gimgs/53_53_mm.jpg',
'http://www.margaridamf.com/files/gimgs/53_53_jr.jpg'].each do |url|
  name = Faker::JapaneseMedia::SwordArtOnline.item
  puts url
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..300))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = ceramics
  new_item.save
  puts "Created new ceramic item named #{name}."
end

# Acessories
['https://images.squarespace-cdn.com/content/v1/5c26b344fcf7fdb35ed3f946/1590006879185-1STN7FFKPEBAEOSOORNM/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/_MG_6011_web.jpg?format=1500w',
'https://images.squarespace-cdn.com/content/v1/5c26b344fcf7fdb35ed3f946/1589980759116-Y47XZHDRH626J7QXEFIS/ke17ZwdGBToddI8pDm48kBqZKGEd5IotpaYmRYDAsV97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UUZVq6ZppKwiX6eDwUo8qraPuy3UhP68HLsKFmqmcZ6fP7cJNZlDXbgJNE9ef52e8w/Green_Front.png?format=1000w',
'https://media.timeout.com/images/105517908/1024/576/image.jpg',
'http://mjoaoarnaud.com/portfolio/wp-content/uploads/2015/11/livrofnac2@mja.jpg',
'http://loja.publico.pt/product_images/x/735/caderno_vasco_01_400px__99741_zoom.jpg',
'http://cutestationeries.net/wp-content/uploads/2018/11/A-stylish-cover-with-a-cover-that-shines-in-the-business-scene-20-en.jpg',
'http://cutestationeries.net/wp-content/uploads/2018/11/A-stylish-cover-with-a-cover-that-shines-in-the-business-scene-21-en.jpg',
'http://mjoaoarnaud.com/portfolio/wp-content/uploads/2014/01/moleskine-021.jpg'].each do |url|
  name = Faker::JapaneseMedia::OnePiece.akuma_no_mi
  puts url
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = accessories
  new_item.save
  puts "Created new acessory item named #{name}."
end

# 4. Users
laure = User.create(name: "laure", email: "laure@gmail.com", password: "123456", is_admin: true)
edgar = User.create(name: "edgar", email: "edgar@gmail.com", password: "123456", is_admin: false)
thomas = User.create(name: "thomas", email: "thomas@gmail.com", password: 123456, is_admin: false)
