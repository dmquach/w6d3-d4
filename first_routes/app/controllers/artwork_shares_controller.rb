class ArtworkSharesController < ApplicationController

    def create
        artwork_shares = ArtworkShare.new(artwork_shares_params)
        # replace the `artwork_attributes_here` with the actual attribute keys
        if artwork_shares.save!
            render json: artwork_shares, status: :created
        else
            render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork_shares = ArtworkShare.find_by(id: params[:id])

        if artwork_shares.nil?
            render json: ['no artwork_shares found'], status: 404
        else artwork_shares.destroy

            render json: ['deletion complete']
        end
    end

    private
    def artwork_shares_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end
end
