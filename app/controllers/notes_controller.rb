class NotesController < ApplicationController

  def index
    @folder = Folder.find(params[:folder_id])
    @notes = @folder.notes.includes(:user)
  end

  def new
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
    @folder = Folder.find(params[:folder_id])
    @notes = @folder.notes.includes(:user)
  end

  def update
    @note = Note.find(params[:id])
    @folder = Folder.find(params[:folder_id])
    if @note.update(note_params)
      redirect_to edit_folder_note_path(@folder, @note)
    else
      @notes = @folder.notes.includes(:user)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :title).merge(user_id: current_user.id)
  end

end
