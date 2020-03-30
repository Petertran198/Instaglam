class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Successfully Created"
      redirect_to root_path
    else
      @errors = [] #This is a work around to pass post model errors to another controllers view page which in this case is the index page of the home controller 
      @post.errors.full_messages.each do |message|
        @errors.push(message)
      end
      flash[:warning] =  @errors.join(", ")
      redirect_to root_path
    end
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy 
    redirect_to user_path(current_user.id)
  end

  def current_post 
    @post = Post.find(params[:id])
  end 



  private 

  def post_params 
    params.require(:post).permit(:description, :user_id, :image)
  end 
end
