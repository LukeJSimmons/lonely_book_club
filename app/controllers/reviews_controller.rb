class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = @book.build_review(review_params)
    if @review.save
      redirect_to @book
    else
      render "books/show"
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to @book, status: :see_other
  end

  private

    def review_params
      params.require(:review).permit(:rating, :body, :book_id)
    end
end
