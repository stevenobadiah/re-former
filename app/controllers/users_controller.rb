class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(user_params)

        if @user.save
          redirect_to users_path
        else
          render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        flash.notice = "User '#{@user.username}' Updated!"
        redirect_to users_path
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end
