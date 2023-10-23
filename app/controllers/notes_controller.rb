class NotesController < ApplicationController

  def index
    @note = Note.new
    @folder = Folder.find(params[:folder_id])
    @notes = @folder.notes.includes(:user)
  end

  def create
    @folder = Folder.find(params[:folder_id])
    @note = @folder.notes.new(note_params)
    if @note.save
      redirect_to folder_notes_path(@folder)
    else
      @notes = @folder.notes.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:content).merge(user_id: current_user.id)
  end

end
