class Api::V1::CommentsController < ApplicationController

    def index
        comments = Comment.all
        render json: comments, only: [:id, :title, :content, :user_id, :post_id]
    end

    def show
        comment = Comment.find(params[:id])
        render json: {id: comment.id, title: comment.title, content: comment.content, user_id: comment.user_id, post_id: comment.post_id}
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: { error: "unable to create comment"}, status: 400
        end
    end

    def update
        comment = Comment.find(params[:id])
        if comment
            comment.update(comment_params)
            render json: { error: "comment successfully updated"}, status: 200
        else
            render json: { error: "unable to update comment"}, status: 400
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        if comment
            comment.destroy
            render json: { error: "comment successfully destroyed"}, status: 200
        else
            render json: { error: "unable to delete comment"}, status: 400
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end

end
