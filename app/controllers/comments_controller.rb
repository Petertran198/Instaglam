class CommentsController < ApplicationController 

    def create 
        #it is post_id because when the route post_comments sends its params it is sending /posts/:post_id/comments
        # In another word it is send us the post_id 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save 
            redirect_to post_path(@post)
        end
    end 



private 

    def comment_params 
        params.require(:comment).permit(:user_name, :body, :post_id)
    end

end