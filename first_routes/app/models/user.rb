# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    inverse_of: :artist,
    dependent: :destroy

    has_many :artwork_shares, # returns join table, user is viewer
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    inverse_of: :viewer,
    dependent: :destroy

    has_many :shared_artworks, # access artwork that was shared to user
    through: :artwork_shares,
    source: :artwork

    has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment,
    inverse_of: :author,
    dependent: :destroy

    has_many :likes,
    foreign_key: :liker_id,
    class_name: :Like,
    inverse_of: :liker,
    dependent: :destroy

end
