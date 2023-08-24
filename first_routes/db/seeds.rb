# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Destroying tables..."
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

# makes ids start at 1
puts "Resetting primary keys..."
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artwork')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares ')

puts "Creating users..."
mike = User.create(username: "mike")
abbey = User.create(username: "abbey")
paulo = User.create(username: "paulo")
dylan = User.create(username: "dylan")
ray = User.create(username: "ray")

puts "Creating artwork"
artwork1 = Artwork.create(title: "art1", image_url: ,artist_id: mike.id)
artwork1 = Artwork.create(title: "art2", image_url: ,artist_id: abbey.id)
artwork1 = Artwork.create(title: "art3", image_url: ,artist_id: paulo.id)
artwork1 = Artwork.create(title: "art4", image_url: ,artist_id: dylan.id)
artwork1 = Artwork.create(title: "art5", image_url: ,artist_id: ray.id)
artwork1 = Artwork.create(title: "art6", image_url: ,artist_id: mike.id)
artwork1 = Artwork.create(title: "art7", image_url: ,artist_id: abbey.id)

puts "Creating artwork shares"
share1 = ArtworkShare.create(artwork_id: "art1", viewer_id: abbey.id)
share1 = ArtworkShare.create(artwork_id: "art2", viewer_id: paulo.id)
share1 = ArtworkShare.create(artwork_id: "art3", viewer_id: dylan.id)
share1 = ArtworkShare.create(artwork_id: "art4", viewer_id: ray.id)
share1 = ArtworkShare.create(artwork_id: "art5", viewer_id: mike.id)
share1 = ArtworkShare.create(artwork_id: "art6", viewer_id: abbey.id)
share1 = ArtworkShare.create(artwork_id: "art7", viewer_id: paulo.id)

puts "Finished"