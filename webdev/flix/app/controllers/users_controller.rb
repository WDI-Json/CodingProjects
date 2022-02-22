class UsersController < ApplicationController

    before_action :require_signin, except: [:new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    scope :by_name, -> {order(:name)}
    scope :not_admins, -> { by_name.where(admin: false) }

    def index
        @users = User.not_admins
    end

    def show
        @user = User.find(params[:id])
        @reviews = @user.reviews
        @favorite_movies = @user.favorite_movies
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
        flash[:notice] = "Account successfully updated!"
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def edit
    end

    def destroy
        session[:user_id] = nil
        @user.destroy
        redirect_to root_path, alert: "Account succesfully deleted"
    end
    
    private

    def user_params
        params.require(:user).
          permit(:name, :email, :password, :password_confirmation, :username)
    end

    def require_correct_user
        @user = User.find(params[:id])
        redirect_to root_url unless current_user?(@user)
      end
    end