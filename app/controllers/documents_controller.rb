class DocumentsController < ApplicationController

  def create
    if params[:event_category] == "appointment"
      @event    = Event.find(params[:appointment_id])
    else
      @event    = Event.find(params[:note_id])
    end

    @document = Document.new(document_params)
    @document.event = @event

    if @document.save
      redirect_to episode_path(@event.episode)
    else
      render
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :document, :category)
  end
end
