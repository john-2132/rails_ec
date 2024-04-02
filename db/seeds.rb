# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Item.create!(
  name: '自家製ベーコン',
  catalog_price: 15.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/bacon.jpg')),
                                                filename: '燻されるベーコンの写真'),
  code: 'M001',
  description: '桜スモークで燻された自家製ベーコンです。熟成2週間。',
  stock: 4
)

Item.create!(
  name: '熊肉',
  catalog_price: 45.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/bear.jpg')),
                                                filename: '熊肉のステーキの写真'),
  code: 'M002',
  description: '穴熊のステーキです。下処理が丁寧で、イメージとは違って臭みはほとんどありません。',
  stock: 3
)

Item.create!(
  name: '鹿肉',
  catalog_price: 40.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/venison.jpg')),
                                                filename: 'エゾシカ肉のステーキの写真'),
  code: 'M003',
  description: 'エゾシカ肉のステーキです。赤身であっさりしていますが、肉質は非常に柔らかく、いくらでも食べられます。',
  stock: 5
)

Item.create!(
  name: 'チタタプ',
  catalog_price: 40.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/chitatapu.jpg')),
                                                filename: 'チタタプの写真'),
  code: 'M004',
  description: 'ゴールデンカムイにより有名な料理となったチタタプです。鍋（オハウ）にツミレ状にして入れ、好みで味噌を溶かして食べます。',
  stock: 6
)

Item.create!(
  name: 'マグロの脳天',
  catalog_price: 15.00,
  sale_price: 7.50,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/nouten.jpg')),
                                                filename: 'マグロの脳天の写真'),
  code: 'F001',
  description: '希少部位であるマグロの脳天です。日本酒にとても良く合い、毎回頼む品です。',
  stock: 8
)

Item.create!(
  name: '日本酒',
  catalog_price: 20.00,
  sale_price: 10.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/nihonshu.jpg')),
                                                filename: '日本酒の写真'),
  code: 'S001',
  description: 'おすすめの日本酒が置かれており、行く度に異なるラインナップが置かれています。',
  stock: 7
)
