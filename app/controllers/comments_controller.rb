class CommentsController < ApplicationController
    # create comment for quotation
    def create
        @quote = Quote.find(params[:quote_id])
        @comment = @quote.comments.create(comment_params)
        redirect_to quote_path(@quote)
    end

    # delete comment
    def destroy
        @quote = Quote.find(params[:quote_id])
        @comment = @quote.comments.find(params[:id])
        @comment.destroy
        redirect_to quote_path(@quote)
    end

    # pass comment params
    private def comment_params
        params.require(:comment).permit(:username, :body)
    end
end
