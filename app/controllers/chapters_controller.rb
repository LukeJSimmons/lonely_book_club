class ChaptersController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.build(chapter_params)
    if @chapter.save
      redirect_to @book
    else
      render "books/show"
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])

    if @chapter.update(chapter_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
  end

  private

    def chapter_params
      params.require(:chapter).permit(:index, :title, :book_id)
    end
end
