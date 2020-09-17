# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"


# 1. Clean DB (from the more specific to the more general)

Review.destroy_all
Order.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all


# 2. Create reviews array

reviews = ["Worst thing ever!", "Barelly usefull", "Meh...", "Kinda cool", "Cool", "Best purchase of my life!"]

reviews_arr = []

reviews.each_with_index do |review, index|
  (index + 1).times { reviews_arr.push(review) }
end


# 3. Create users

laure = User.create(name: "laure", email: "laure@gmail.com", password: "123456", is_admin: true)
thomas = User.create(name: "thomas", email: "thomas@gmail.com", password: "123456", is_admin: false)
edgar = User.create(name: "edgar", email: "edgar@gmail.com", password: "123456")
julie = User.create(name: "julie", email: "julie@gmail.com", password: "123456")
nuno = User.create(name: "nuno", email: "nuno@gmail.com", password: "123456")
ana = User.create(name: "ana", email: "ana@gmail.com", password: "123456")
carla = User.create(name: "carla", email: "carla@gmail.com", password: "123456")
sofia = User.create(name: "sofia", email: "sofia@gmail.com", password: "123456")
ruben = User.create(name: "ruben", email: "ruben@gmail.com", password: "123456")
tiago = User.create(name: "tiago", email: "tiago@gmail.com", password: "123456")
jonh = User.create(name: "jonh", email: "jonh@gmail.com", password: "123456")
maria = User.create(name: "maria", email: "maria@gmail.com", password: "123456")

users_arr = [edgar, julie, nuno, ana, carla, sofia, ruben, tiago, jonh, maria]


# 4. Categories

carpets = Category.create(name: "Carpets")
mantas = Category.create(name: "Manta")
lighting = Category.create(name: "Lighting")
ceramics = Category.create(name: "Ceramics")
accessories = Category.create(name: "Accessories")
walls_decoration = Category.create(name: "Decoration for walls")
kids_decoration = Category.create(name: "Decoration for kids")


# 5. Items

# Carpets
['https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1585223058511-REPXSNHSQXJJHLTGKV2E/ke17ZwdGBToddI8pDm48kBv_UPqonc0QkjVp7lmusaZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UdNiEGXG47E3xSiX-ojSoZKb8mEd0hsLap4_Sxpb3yWLeWxRHzm0xMjpe8EpHYJrIw/IMG_5867.jpg?format=500w',
'https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1473010640871-V35W2ZI1UUMEABSCYY2I/ke17ZwdGBToddI8pDm48kMXRibDYMhUiookWqwUxEZ97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0luUmcNM2NMBIHLdYyXL-Jww_XBra4mrrAHD6FMA3bNKOBm5vyMDUBjVQdcIrt03OQ/Jangada_detalhe1.jpg?format=500w',
'https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1473010718664-HPVWREL3A7C2MSX2H92P/ke17ZwdGBToddI8pDm48kMXRibDYMhUiookWqwUxEZ97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0luUmcNM2NMBIHLdYyXL-Jww_XBra4mrrAHD6FMA3bNKOBm5vyMDUBjVQdcIrt03OQ/Aqua_detalhe1.jpg?format=500w',
'https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1473010519250-ZBPN70OPVSPV7GQ4VD28/ke17ZwdGBToddI8pDm48kMXRibDYMhUiookWqwUxEZ97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0luUmcNM2NMBIHLdYyXL-Jww_XBra4mrrAHD6FMA3bNKOBm5vyMDUBjVQdcIrt03OQ/California_detalhe1.jpg?format=500w',
'https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1585223058511-REPXSNHSQXJJHLTGKV2E/ke17ZwdGBToddI8pDm48kBv_UPqonc0QkjVp7lmusaZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UdNiEGXG47E3xSiX-ojSoZKb8mEd0hsLap4_Sxpb3yWLeWxRHzm0xMjpe8EpHYJrIw/IMG_5867.jpg?format=500w',
'https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1535442704768-0XB05LXJE9FFEGYSLZJJ/ke17ZwdGBToddI8pDm48kGimpnGS74lOCXEVScmdKfQUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8GRo6ASst2s6pLvNAu_PZdJblJnDTNjTASBy3WMly_ic7RFeFNz6WHDDme815vyzW9AukLhYm2lpbtr2HKmuE68/Toscana.jpg?format=1000w',
'https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1473005247379-P4YY9NRQ6SBWSL2HO0CF/ke17ZwdGBToddI8pDm48kDx2fgHInw5ktiwHDQP7SnoUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8PaoYXhp6HxIwZIk7-Mi3Tsic-L2IOPH3Dwrhl-Ne3Z2A2aQTf0W060ps_bdfkPa_Ut-EFX1gmEuO_C938t8rMakL3r1G49e-3ZnDLNRdB_t/jardim_0.jpg?format=1000w',
'https://images.squarespace-cdn.com/content/v1/56a8ba9db20943f2881fedbc/1473004622273-MTVPAXVHL556HTWULWOB/ke17ZwdGBToddI8pDm48kGCtUSrv_iXW0PSYtcht8HNZw-zPPgdn4jUwVcJE1ZvWEtT5uBSRWt4vQZAgTJucoTqqXjS3CfNDSuuf31e0tVFw2WlHkL4iNX4jXyJfMwAz0NBKXCGEDvaOS0pBNucM3sckFGyUjJZh3ndWWxwNSUA/thumb_IMG_6612_1024.jpg?format=1000w'].each do |url|
  name = Faker::JapaneseMedia::OnePiece.character
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(100..300))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = carpets
  new_item.save
  puts "Created new carpet named #{name}."
  4.times do
    review_content = reviews_arr[rand(0..20)]
    review = Review.new(rating: reviews.index(review_content), content: review_content)
    review.item = new_item
    review.user = users_arr[rand(0..9)]
    review.save
  end
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
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price:rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = mantas
  new_item.save
  puts "Created new manta named #{name}."
  4.times do
    review_content = reviews_arr[rand(0..20)]
    review = Review.new(rating: reviews.index(review_content), content: review_content)
    review.item = new_item
    review.user = users_arr[rand(0..9)]
    review.save
  end
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
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = lighting
  new_item.save
  puts "Created new lighting item named #{name}."
  4.times do
    review_content = reviews_arr[rand(0..20)]
    review = Review.new(rating: reviews.index(review_content), content: review_content)
    review.item = new_item
    review.user = users_arr[rand(0..9)]
    review.save
  end
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
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..300))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = ceramics
  new_item.save
  puts "Created new ceramic item named #{name}."
  4.times do
    review_content = reviews_arr[rand(0..20)]
    review = Review.new(rating: reviews.index(review_content), content: review_content)
    review.item = new_item
    review.user = users_arr[rand(0..9)]
    review.save
  end
end

# Acessories
['https://images.squarespace-cdn.com/content/v1/5c26b344fcf7fdb35ed3f946/1590006879185-1STN7FFKPEBAEOSOORNM/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/_MG_6011_web.jpg?format=1500w',
'https://images.squarespace-cdn.com/content/v1/5c26b344fcf7fdb35ed3f946/1589980759116-Y47XZHDRH626J7QXEFIS/ke17ZwdGBToddI8pDm48kBqZKGEd5IotpaYmRYDAsV97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UUZVq6ZppKwiX6eDwUo8qraPuy3UhP68HLsKFmqmcZ6fP7cJNZlDXbgJNE9ef52e8w/Green_Front.png?format=1000w',
'https://media.timeout.com/images/105517908/1024/576/image.jpg',
'http://mjoaoarnaud.com/portfolio/wp-content/uploads/2015/11/livrofnac2@mja.jpg',
'http://loja.publico.pt/product_images/x/735/caderno_vasco_01_400px__99741_zoom.jpg',
'http://mjoaoarnaud.com/portfolio/wp-content/uploads/2014/01/moleskine-021.jpg'].each do |url|
  name = Faker::JapaneseMedia::OnePiece.akuma_no_mi
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = accessories
  new_item.save
  puts "Created new acessory item named #{name}."
  4.times do
    review_content = reviews_arr[rand(0..20)]
    review = Review.new(rating: reviews.index(review_content), content: review_content)
    review.item = new_item
    review.user = users_arr[rand(0..9)]
    review.save
  end
end

# Wall decorations
['https://payload.cargocollective.com/1/1/37038/13751167/CAPA_1000.jpg',
'https://payload.cargocollective.com/1/1/37038/13751167/MAPA_1000.JPG',
'https://payload.cargocollective.com/1/1/37038/13751167/MAPA1_1000.jpg',
'https://payload.cargocollective.com/1/1/37038/13751167/TRAJES_1000.jpg',
'https://payload.cargocollective.com/1/1/37038/13751167/INCM_Etnografia_Miolo_Pato-16-12_1000.jpg',
'https://payload.cargocollective.com/1/1/37038/13751167/INCM_Etnografia_Miolo_Pato-16-16_1000.jpg',
'https://payload.cargocollective.com/1/1/37038/13751167/CORETOS_1000.jpg'].each do |url|
  name = Faker::JapaneseMedia::OnePiece.island
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..300))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = walls_decoration
  new_item.save
  puts "Created new wall decoration's item named #{name}."
  4.times do
    review_content = reviews_arr[rand(0..20)]
    review = Review.new(rating: reviews.index(review_content), content: review_content)
    review.item = new_item
    review.user = users_arr[rand(0..9)]
    review.save
  end
end

# Kids decorations
['https://res.cloudinary.com/streethub/image/upload/w_690,f_auto,q_auto:eco,dpr_auto,c_pad,b_white/v1549290784/brand/5c4b54fe222bc20003664d9c/036eb148-5b45-42e0-b722-4ed226688e2b.jpg',
'https://res.cloudinary.com/streethub/image/upload/w_690,f_auto,q_auto:eco,dpr_auto,c_pad,b_white/v1549290785/brand/5c4b54fe222bc20003664d9c/d5bcd3c9-3049-4320-9c5d-091eab19c2e1.jpg',
'https://res.cloudinary.com/streethub/image/upload/w_690,f_auto,q_auto:eco,dpr_auto,c_pad,b_white/v1549290784/brand/5c4b54fe222bc20003664d9c/c71c9037-436f-4b53-9588-336e9ad08b31.jpg',
'https://res.cloudinary.com/streethub/image/upload/w_690,f_auto,q_auto:eco,dpr_auto,c_pad,b_white/v1549290784/brand/5c4b54fe222bc20003664d9c/1c8e92bd-722e-4a6f-84fa-b2835cd34239.jpg',
'https://www.objectsmag.it/wp-content/uploads/2018/11/peluche-artigianali-di-mauvais-marie-1.jpg'].each do |url|
  name = Faker::DcComics.hero
  file = URI.open(url)
  new_item = Item.new(name: name, description: "Give your home a vibrant, coulourful and creative touch !", price: rand(50..200))
  new_item.picture.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_item.category = kids_decoration
  new_item.save
  puts "Created new kids decoration's item named #{name}."
  4.times do
    review_content = reviews_arr[rand(0..20)]
    review = Review.new(rating: reviews.index(review_content), content: review_content)
    review.item = new_item
    review.user = users_arr[rand(0..9)]
    review.save
  end
end
