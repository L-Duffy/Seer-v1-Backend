# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(name: "test", email: "test@test.com", password: "password", password_confirmation: "password")

fido_park = Image.create!(image_url: "http://placekitten.com/200/300", name: "Fido in park", description: "Fido running to catch a frisbee in the park.", user_id: 1)
fido_couch = Image.create!(image_url: "http://placekitten.com/200/300", name: "Fido on couch", description: "Fido relaxing on the couch by the fireplace.", user_id: 1)

pet_tag = Tag.create!(name: "pet")
park_tag = Tag.create!(name: "park")
moving_tag = Tag.create!(name: "moving")
frisbee_tag = Tag.create!(name: "frisbee")
fido_tag = Tag.create!(name: "fido")
indoors_tag = Tag.create!(name: "indoors")
couch_tag = Tag.create!(name: "couch")
fireplace_tag = Tag.create!(name: "fireplace")

ImageTag.create!(image_id: "1", tag_id: "1")
ImageTag.create!(image_id: "1", tag_id: "2")
ImageTag.create!(image_id: "1", tag_id: "3")
ImageTag.create!(image_id: "1", tag_id: "4")
ImageTag.create!(image_id: "1", tag_id: "5")
ImageTag.create!(image_id: "2", tag_id: "1")
ImageTag.create!(image_id: "2", tag_id: "5")
ImageTag.create!(image_id: "2", tag_id: "6")
ImageTag.create!(image_id: "2", tag_id: "7")
ImageTag.create!(image_id: "2", tag_id: "8")
