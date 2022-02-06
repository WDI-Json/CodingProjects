class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user, notice: "Thanks signing up!"
        else
          render :new
        end
      end

    def update
        @user = User.find(params[:id])
        flash[:notice] = "Account successfully updated!"
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        session[:user_id] = nil
        @user.destroy
        redirect_to root_path, alert: "Account succesfully deleted"
    end
    private

    def user_params
        params.require(:user).
          permit(:name, :email, :password, :password_confirmation, :username)
    end

end
