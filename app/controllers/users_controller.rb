class UsersController < ApplicationController
    before_action :authenticate_user!
    def show 
        @user = User.find(params[:id])
    end

    def edit 
        @user = User.find(current_user.id)

    end 
    def update 
        
        if current_user.update(user_params)
            redirect_to current_user
        else

        end
    end

    private 
    def user_params 
        params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender, :avatar)
    end
end
