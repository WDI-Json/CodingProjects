class ReviewsController < ApplicationController
    
    
    def index
        @movie = Movie.find(params[:movie_id])
        @reviews = @movie.reviews
    end

    def new
        @movie = Movie.find(params[:movie_id])
        @reviews = @movie.reviews.new
    end

    def create
        @movie = Movie.find(params[:movie_id])
        @reviews = @movie.reviews.new(params[:registration])
        if @reviews.save 
            redirect_to(@movie)
        else
            render :new
        end
    end

    private 
    def set_movie
        @movie = Movie.find(params[:movie_id])
    end

end
