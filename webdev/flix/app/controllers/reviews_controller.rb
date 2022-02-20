class ReviewsController < ApplicationController
  before_action :require_signin  
  before_action :set_movie
    
    def index
        @reviews = @movie.reviews
    end

    def new
        @review = @movie.reviews.new
    end

    def create
      @review = @movie.reviews.new(review_params)
      @review.user = current_user
      if @review.save
          redirect_to movie_reviews_path(@movie),
                        notice: "Thanks for your review!"
      else
        render :new
      end
    end

    def edit
      @review = Review.find(params[:id])
    end

    def update
      @review = Review.find(params[:id])
      flash[:notice] = "Review successfully updated!"
      if @review .update(review_params)
        redirect_to movie_reviews_path(@movie)
      else
        render :edit
      end
    end

    def destroy
      @review = Review.find(params[:id])
      flash[:alert] = "Review successfully deleted!"
      @review.destroy
      redirect_to(@movie) 
    end

    private
    def review_params
      params.require(:review).permit(:comment, :stars)
    end
  
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end
