class CommentsController < ApplicationController 

    def create 
        #it is post_id because when the route post_comments sends its params it is sending /posts/:post_id/comments
        # In another word it is send us the post_id 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save 
            redirect_to post_path(@post)
        end
    end 

    def edit 
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end 


    def update 
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else 
            flash[:warning] = "Please enter a comment"
            render 'edit'
        end
    end 

    def destroy 
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy 
        redirect_to post_path(@post)
    end

private 

    def comment_params 
        params.require(:comment).permit(:user_name, :body, :post_id)
    end

end