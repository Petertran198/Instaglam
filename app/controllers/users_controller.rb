class UsersController < ApplicationController
    before_action :authenticate_user!
    def find_friends
        #used .join to query all user that has an attachment
        # Convention for this is <NAME OF ATTACHMENT>_attachment so thats why it is avatar_attachment 
        @users = User.joins(:avatar_attachment).paginate(page: params[:page], per_page: 5)

    end

    def show 
        @user = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc).paginate(page: params[:page], per_page: 3)

    end

    def edit 
        @user = User.find(current_user.id)

    end 


    def update    
        if current_user.update(user_params)
            redirect_to current_user
        else
            render 'edit'
        end
    end
    

    #follow user
    def followings 
        # This is to save the @user's id as an integer
        # params are always a string and in this case we want to store integers because our user_id & id attribute is an integer 
        #In addition You have to push in an integer because on the show  page it is searching for if current_user.following.include?(@user.id) and @user.id is an int
        current_user.following.push(params[:id].to_i)
        current_user.save 
        ## After we will than redirect to id that is provided in the view page following_path(id: @user.id)
        redirect_to user_path(params[:id])

    end
    #  Unfollow user
    def unfollow
        current_user.following.delete(params[:id].to_i)
        current_user.save 
        redirect_to user_path(params[:id])
    end


    private 
    def user_params 
        params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar)
    end
end
