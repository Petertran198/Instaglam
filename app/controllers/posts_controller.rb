class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Successfully Created"
      redirect_to root_path
    else
      flash[:notice] = "Error, could not save "
      redirect_to root_path
    end
  #  Post.create(post_params)
  #   redirect_to root_path
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy 
    redirect_to user_path(current_user.id)
  end
  private 

  def post_params 
    params.require(:post).permit(:description, :user_id, :image)
  end 
end
