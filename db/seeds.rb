# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"

# Clean DB
Item.destroy_all
Category.destroy_all
User.destroy_all

# Categories
carpets = Category.create(name: "Carpets")
mantas = Category.create(name: "Manta")
lighting = Category.create(name: "Lighting")
ceramics = Category.create(name: "Ceramics")
accessories = Category.create(name: "Accessories")
walls_decoration = Category.create(name: "Decoration for walls")
kids_decoration = Category.create(name: "Decoration for kids")

# Items

# Carpets
num = 375560
20.times do
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
['https://images-na.ssl-images-amazon.com/images/I/71WSL5sN5PL._AC_SX522_.jpg',
'https://cdn-mw.niceshops.com/upload/image/product/large/default/zoeppritz-blanket-soft-fleece-strawberry-763992-en.jpg',
'https://images-na.ssl-images-amazon.com/images/I/81poyO0UlDL._AC_SX522_.jpg',
'https://cdn-mw.niceshops.com/upload/image/product/large/default/zoeppritz-soft-fleece-blanket-baby-80x100-cm-762972-en.jpg',
'https://images-na.ssl-images-amazon.com/images/I/81U1tji5z4L._AC_SL1500_.jpg',
'https://cdn1.brandability.co.za/2017/11/19224735/Everest-Sherpa-Blanket-Red.jpg',
'https://www.yogadirect.com/assets/images/Deluxe%20Mex%20Blankets_Red_Orange.jpg',
'https://www.ynmblanket.ca/wp-content/uploads/2018/12/ynm-cooling-blanket.jpg'].each do |url|
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
['https://www.deltalight.com/frontend/files/products/images/650x650/26011_936X_PF02.jpg',
'https://www.deltalight.com/frontend/files/products/images/650x650/25822_0000_DET01.jpg',
'https://img2.cgtrader.com/items/843005/7da88c57c8/intrigue-stand-lamp-3d-model-max-bip-obj-mtl-3ds-fbx.jpg',
'https://i.etsystatic.com/16854380/r/il/65e572/1550991620/il_570xN.1550991620_3ptz.jpg',
'https://i.pinimg.com/originals/fc/c3/f3/fcc3f3b158efca36ebc6f74742513707.jpg',
'https://www.homesdirect365.co.uk/images/simple-white-table-lamp-p44533-41102_zoom.jpg',
'https://www.reginaandrew.com/SSP%20Applications/NetSuite%20Inc.%20-%20SCA%20Mont%20Blanc/Development/assets/img/13-1369_1.jpg?resizeid=2&resizeh=500&resizew=0',
'https://www.lightingcompany.co.uk/images/bankers-lamp-traditional-desk-light-green-shade-p23-4178_zoom.jpg'].each do |url|
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
['https://66.media.tumblr.com/24690446a2ed8e174a0d2592f2d3832c/tumblr_inline_pk09qf2FNa1qecfdw_500.jpg',
'https://cdn.shopify.com/s/files/1/0119/2122/7876/files/01fe07a62802dfd5c93710f00c7e0115defc8126dc_480x480.jpg?v=1546392101',
'https://static.rcwilley.com/products/111451167/Blue-and-White-Abstract-Ceramic-Sculpture-rcwilley-image1~800.jpg',
'https://www.crikarsmarshall.com/uploads/4/5/4/6/4546722/818854_orig.jpg',
'https://images-na.ssl-images-amazon.com/images/I/81bs4OVD8YL._SL1500_.jpg',
'https://www.culinaris.eu/WebRoot/Store17/Shops/61562434/5D25/CE68/FC70/8363/B13C/0A0C/6D06/D792/5ksm2cb5tml_3.jpg',
'https://i.pinimg.com/originals/13/66/ed/1366ed6fbb841c81d0f8d234f8346cb2.jpg'].each do |url|
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
['https://i.pinimg.com/originals/f3/0a/ba/f30aba659d0ca9cf0d6cf14ac1e6b742.jpg',
'https://p1.pxfuel.com/preview/132/215/578/jewelry-beads-bracelet-fashion.jpg',
'https://cdn.shopify.com/s/files/1/3016/7980/products/34_1024x1024@2x.png?v=1571711578',
'https://www.nicepng.com/png/detail/372-3720276_peacock-feather-pearl-pet-hair-clip-peacock-feather.png',
'https://image.made-in-china.com/202f0j00EJmTuqbnAokU/Women-Accessories-Jewelry-Rose-Gold-Charm-Stainless-Steel-Pearl-Bracelet.jpg',
'https://cdn.shopify.com/s/files/1/0864/0890/products/Untitled_design-86_1024x1024.png?v=1559171398',
'https://cdn.shopify.com/s/files/1/1212/1924/products/royal_clipped_rev_1_1024x.jpeg?v=1587762526',
'https://www.dhresource.com/0x0/f2/albu/g2/M01/20/EB/rBVaGlZFjuOALmGRAANDRQat4Ko361.jpg'].each do |url|
  name = Faker::JapaneseMedia::OnePiece.akuma_no_mi
  puts url
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = accessories
  new_item.save
  puts "Created new acessory item named #{name}."
end

# Wall decorations
['https://cdn.shopify.com/s/files/1/0049/0314/1447/products/Iron-tree-wall-decor-item-unique-Design_3daac80d-26eb-4006-b813-0f7cd0f8ed8e_1200x1200.jpg?v=1571711006',
'https://sc01.alicdn.com/kf/UTB8f70BCwQydeJk43PUq6AyQpXax/934022607/UTB8f70BCwQydeJk43PUq6AyQpXax.jpg_.webp',
'https://i.pinimg.com/originals/15/dc/21/15dc217b666e9153d611fd0de23e506e.jpg',
'https://www.dhoumm.co/cdn-k1/ho/wooden-home-decor-items-talentneeds_room-interior-and-decoration.jpg',
'https://ae01.alicdn.com/kf/HTB14oAoOFXXXXbEaFXXq6xXFXXXw/Handmade-authentic-Continental-Iron-diamond-peacock-wall-clock-clock-watch-silent-living-room-wall-clock-American.jpg',
'https://ae01.alicdn.com/kf/H131558a31d554370b94b4a1b6d36a8407/Wall-clock-home-decoration-quartz-clock-painting-clock-design-modern-bird-unique-gift-art-era-popular.jpg',
'https://ctl.s6img.com/society6/img/_VbKuZs1FZmavkvHbPXab6_gySU/w_700/wall-clocks/front/natural-frame/white-hands/~artwork,fw_3500,fh_3500,iw_3500,ih_3500/s6-0059/a/24986683_15577680/~~/bamboo-b0i-wall-clocks.jpg',
'https://www.contemporaryheaven.co.uk/gfx/uploads/roman-big-vintage-bronze-skeleton-wall-clock-120cm-diameter-bronze-6991-zoom.jpg'].each do |url|
  name = Faker::JapaneseMedia::OnePiece.island
  puts url
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..300))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = walls_decoration
  new_item.save
  puts "Created new wall decoration's item named #{name}."
end

# Kids decorations
['https://my-live-01.slatic.net/p/142b400e2a423934f38d8ac43082616f.jpg',
'https://i.etsystatic.com/14593655/r/il/041632/1439373434/il_570xN.1439373434_mxcn.jpg',
'https://i.pinimg.com/originals/9e/e8/fd/9ee8fdf0de0c047739c060dd3f4cf056.jpg',
'https://www.dhresource.com/0x0/f2/albu/g6/M00/15/F0/rBVaSFteik6AWWy0AAF1br9My_U696.jpg',
'https://img.staticbg.com/thumb/large/oaupload/banggood/images/E6/2B/2aa8e4b3-ffdc-4bd8-af24-34ccf8a3ac93.jpg',
'https://www.lushome.com/wp-content/uploads/2012/01/desk-lamp-ideas-for-kids-rooms.jpg',
'https://images-na.ssl-images-amazon.com/images/I/61N%2B4r6T-OL._AC_SX522_.jpg'].each do |url|
  name = Faker::DcComics.hero 
  puts url
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = kids_decoration
  new_item.save
  puts "Created new kids decoration's item named #{name}."
end

# 3. USERS
laure = User.create(name: "laure", email: "laure@gmail.com", password: "123456", is_admin: true)
edgar = User.create(name: "edgar", email: "edgar@gmail.com", password: "123456", is_admin: false)

