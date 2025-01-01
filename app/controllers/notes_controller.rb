class NotesController < ApplicationController
  def create
    @chapter = Chapter.find(params[:chapter_id])
    @note = @chapter.build_note(note_params)
    unless @note.save
      redirect_to book_path(@chapter.book_id)
    end
  end

  def update
    @chapter = Chapter.find(params[:chapter_id])
    @note = Note.find(@chapter.note.id)
    
    unless @note.update(note_params)
      redirect_to book_path(@chapter.book_id)
    end
  end

  def destroy
    @chapter = Chapter.find(params[:chapter_id])
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to book_path(@chapter.book_id), status: :see_other
  end

  private

    def note_params
      params.require(:note).permit(:content, :chapter_id)
    end
end
