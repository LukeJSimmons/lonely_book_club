class BooksController < ApplicationController
  before_action :require_login

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def require_login
      unless user_signed_in?
        flash[:alert] = "You must be logged in to access this section."
        redirect_to new_user_session_path
      end
    end

    def book_params
      params.require(:book).permit(:title, :genre, :pages, :user_id)
    end
end
