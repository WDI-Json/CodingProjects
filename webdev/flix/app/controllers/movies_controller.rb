class MoviesController < ApplicationController
    before_action :require_signin, except: [:index, :show]
    before_action :require_admin, except: [:index, :show]
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index
        @movies = Movie.send(movies_filter)
    end
    
    def show
        @genres = @movie.genres.order(:name)
        @fans = @movie.fans
        if current_user
            @favorite = current_user.favorites.find_by(movie_id: @movie.id)
        end
    end

    def edit
    end

    def update
        flash[:notice] = "Movie successfully updated!"
        if @movie.update(movie_params)
            redirect_to(@movie)
        else
            render :edit
        end
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            flash[:notice] = "Movie successfully created!"
            redirect_to(@movie) 
       else
           render :new
       end
    end

    def destroy
        flash[:alert] = "Movie successfully deleted!"
        @movie.destroy
        redirect_to(movies_url)
    end

    private 
    def movie_params
        params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, 
            :director, :duration, :main_image, genre_ids: [])
    end

    def movies_filter
        if params[:filter].in? %w(upcoming recent hits flops)
          params[:filter]
        else
          :released
        end
    end
    
    private 
    def set_movie
        @movie = Movie.find_by!(slug: params[:id])
    end
end
