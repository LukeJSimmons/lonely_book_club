class NotesController < ApplicationController
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @note = @chapter.build_note(note_params)
    unless @note.save
      redirect_to root_path
    end
  end

  def update
    @chapter = Chapter.find(params[:chapter_id])
    @note = Note.find(@chapter.note.id)
    
    unless @note.update(note_params)
      redirect_to root_path
    end
  end

  def destroy
    @chapter = Chapter.find(params[:chapter_id])
    @book = Book.find(@chapter.book_id)
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to @book, status: :see_other
  end

  private

    def note_params
      params.require(:note).permit(:content, :chapter_id)
    end
end
