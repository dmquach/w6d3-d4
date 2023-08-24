class CommentsController < ApplicationController
    def index
        if params[:user_id].nil? && params[:artwork_id].nil?
            render json: ['no id found'], status: 404 
        elsif params[:user_id].nil?
            art = Artwork.find_by(id: params[:artwork_id])
            render json: art.comments
        else
            user = User.find_by(id: params[:user_id])
            render json: user.comments
        end
    end

    def create
        comment = Comment.new(comment_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if comment.save!
            render json: comment, status: :created
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment_id = comment.dup
        if comment.nil?
            render json: ['no comment found']
        else comment.destroy
            render json: comment_id
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end
end