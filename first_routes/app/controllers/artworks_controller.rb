class ArtworksController < ApplicationController
    def index
        # artworks = Artwork.all
        # render json: artworks

        # user = User.find_by(id: params[:user_id])
        # owned = user.artworks
        # shared = user.shared_artworks
        # render json: {artworks: owned, shared_artworks: shared}
        render json: Artwork.artworks_for_user_id(params[:user_id])
    end

    def create
        artwork = Artwork.new(artwork_params)
        # replace the `artwork_attributes_here` with the actual attribute keys
        if artwork.save!
            render json: artwork, status: :created
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end


    def show
        render json: Artwork.find_by(id: params[:id])
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: ['no artwork found']
        elsif artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: ['no artwork found'], status: 404
        else artwork.destroy
            redirect_to artwork_url
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
