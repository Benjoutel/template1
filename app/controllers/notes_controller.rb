class NotesController < ApplicationController


  def new
    @episode = Episode.find(params[:episode_id])
    @note = Event.new(category: "note")

  end

  def create
    @episode = Episode.find(params[:episode_id])
    @note = Event.new(episode_id: @episode.id ,category:"note", description: note_params[:description], date: DateTime.now)
    if @note.save
      redirect_to episode_path(@episode)
    else

    end
  end

  def edit
     @note = Event.find(params[:id])
  end

  def update
    @note = Event.find(params[:id])
    @note.update(note_params)

    if @note.save
       redirect_to episode_path(@note.episode_id)
    else
    end
  end


private

  def note_params
      params.require(:event).permit(:description )
  end


end
