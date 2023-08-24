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
artwork1 = Artwork.create(title: "art1", image_url: "url1", artist_id: mike.id) #
artwork2 = Artwork.create(title: "art2", image_url: "url2", artist_id: abbey.id)
artwork3 = Artwork.create(title: "art3", image_url: "url3", artist_id: paulo.id)
artwork4 = Artwork.create(title: "art4", image_url: "url4", artist_id: dylan.id)
artwork5 = Artwork.create(title: "art5", image_url: "url5", artist_id: ray.id) ##
artwork6 = Artwork.create(title: "art6", image_url: "url6", artist_id: mike.id) #
artwork7 = Artwork.create(title: "art7", image_url: "url7", artist_id: abbey.id)

puts "Creating artwork shares"
share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: abbey.id)
share2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: paulo.id)
share3 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: dylan.id)
share4 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: ray.id)
share5 = ArtworkShare.create(artwork_id: artwork5.id, viewer_id: mike.id) #
share6 = ArtworkShare.create(artwork_id: artwork6.id, viewer_id: abbey.id)
share7 = ArtworkShare.create(artwork_id: artwork7.id, viewer_id: paulo.id)

puts "Finished"