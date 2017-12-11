class CaregiversController < ApplicationController

  def create
    # @episode = Episode.find(params[:episode_id])
    # @note = Event.new(episode_id: @episode.id ,category:"note", description: note_params[:description], date: Date.today)
    # if @note.save
    #   redirect_to episode_path(@episode)
    # else

    # end
  end


private

  def note_params
      params.require(:event).permit(:description )
  end
end
