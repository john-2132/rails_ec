# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Item.create!(
  name: 'Item',
  catalog_price: 30.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('images/item.jpg')), filename: 'item.jpg')
)

Item.create!(
  name: 'Sample',
  catalog_price: 20.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('images/sample.jpg')),
                                                filename: 'sample.jpg')
)

Item.create!(
  name: 'Test',
  catalog_price: 48.00,
  sale_price: 24.00,
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('images/test.jpg')), filename: 'test.jpg')
)
