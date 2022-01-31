class MoviesController < ApplicationController
    def index
        @movies = Movie.released
    end
    
    def show
        @movie = Movie.find(params[:id])
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])
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
        @movie = Movie.find(params[:id])
        flash[:alert] = "Movie successfully deleted!"
        @movie.destroy
        redirect_to(movies_url)
    end

    private 
    def movie_params
        params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, 
            :director, :duration, :image_file_name)
    end
end
