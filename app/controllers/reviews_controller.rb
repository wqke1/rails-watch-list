class ReviewsController < ApplicationController
  def create
    @review = Reviews(review_params)
    @list = List.find(params[:id])
    @review.list = @list
    if @review.save
      redirect_to_list_path(@list)
    else
      render 'list/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
