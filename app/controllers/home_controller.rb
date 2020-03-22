class HomeController < ApplicationController
  def index
    @posts =  Post.all.order(created_at: :desc) #display all the post once it is submitted

  end
end
