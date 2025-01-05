class BooksController < ApplicationController
  before_action :require_login

  def index
    @books = Book.all

    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.build_author
    @book.build_genre
  end

  def create
    author = if book_params[:author_id].present?
                Author.find(book_params[:author_id])
    elsif book_params[:author_attributes][:name].present?
                Author.find_or_initialize_by(name: book_params[:author_attributes][:name])
    end

    genre = if book_params[:genre_id].present?
              Genre.find(book_params[:genre_id])
    elsif book_params[:genre_attributes][:name].present?
              Genre.find_or_initialize_by(name: book_params[:genre_attributes][:name])
    end

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.author = author
    @book.genre = genre

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other
  end

  private

    def require_login
      unless user_signed_in?
        flash[:alert] = "You must be logged in to access this section."
        redirect_to new_user_session_path
      end
    end

    def book_params
      params.require(:book).permit(:title, :genre, :pages, :total_chapters, :user_id, :author_id, :genre_id, author_attributes: [ :name ], genre_attributes: [ :name ])
    end
end
