class ReviewsController < ApplicationController

  def index
    # This is our list page for our reviews
    @number = rand(100)
    @reviews = Review.all
  end


  def new
    # The form for adding a new review
    @review = Review.new
  end


  def create
    # Take info from the form and add it to the model
    @review = Review.new(form_params)

    # Check if model can be saved, if it is, we go back to the home page
    # If it does not, the new form shows

    if @review.save
      redirect_to root_path

    else
      # Show the view for new.html.erb
      render "new"
    end

  end

  def show
    # individual review page
    @review = Review.find(params[:id])

  end

  def destroy

    #find the review
    @review = Review.find(params[:id])

    #destroy
    @review.destroy

    #redirect to the home page
    redirect_to root_path

  end


  def edit

    #find the review (to edit)
    @review = Review.find(params[:id])

  end

  def update
    #find the review
    @review = Review.find(params[:id])

    #update with new information
    if @review.update(form_params)

      #redirect
      redirect_to review_path(@review)
    else
      render "edit"
    end

  end


  def form_params
    params.require(:review).permit(:title, :restaurant, :body, :score, :ambience)
  end

end