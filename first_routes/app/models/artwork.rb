# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :artist_id, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist,
    # foreign_key: :artist_id,
    class_name: :User

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    inverse_of: :artwork,
    dependent: :destroy

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    has_many :comments,
    foreign_key: :artwork_id,
    inverse_of: :artwork,
    dependent: :destroy

    has_many :likes, as: :likeable

    def self.artworks_for_user_id(id)
        Artwork.left_joins(:artwork_shares)
        .where("artwork_shares.viewer_id = #{id} or artworks.artist_id = #{id}")
        .distinct
    end

end
