class HomeController < ApplicationController
  require 'will_paginate/array' ##This is required to set up pagination for an array 

  def index
    if user_signed_in?
      #this array is to show only post that are of the current user and post that the user follows
      @following_post  = []
      Post.all.each do |post|
        if current_user.following.include?(post.user.id) || current_user.id == post.user.id 
          @following_post.push(post)

        end
      end
      @following_post = @following_post.paginate(page: params[:page], per_page: 3)
   end
  end

  def following 


  end 



end
