class PostsController < ApplicationController
  def create

  end

  private 

  def post_params 
    params.require(:post).permit(:description, :user_id, :image)
  end 
end
