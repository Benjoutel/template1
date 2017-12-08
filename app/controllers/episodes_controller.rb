class EpisodesController < ApplicationController

  def show
    @episode      = Episode.find_by_id(params[:id])
    @events       = Event.where(episode_id: @episode.id).order(date: :desc)
    # @events = @episode.events.order(date: :desc)
    @appointment  = Event.new(category: "appointment")
    @note         = Event.new(category: "note")
    @caregivers   = Caregiver.where(patient_id: @episode.patient_id)
    @document     = Document.new
    # @document_categories = Document.group(:category).count.sort_by{ |k, v| v }.reverse.to_h
  end

  def index
    # @episodes = Episode.where(patient_id: current_patient.id)
    # better use of associations
    @episodes = current_patient.episodes
    if params[:name]
      @episodes = @episodes.where("name ILIKE ?", "%#{params[:name]}%")
    end
    # joins events and order episodes by update date
  end

  def chrono
    @events = Event.
      joins(:episode).
      where(episodes: { patient_id: current_patient.id }).
      order(date: :desc)
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode        = Episode.new(episode_params)
    @episode.patient = current_patient
    initial_event   = Event.new(category: "note", description: "Création de l'épisode #{@episode.name}", date: Date.today)
    @episode.events << initial_event
    if @episode.save
      redirect_to episodes_path
    else
      render :new
    end
  end

  private

  def episode_params
    params.require(:episode).permit(:name, :description)
  end

end
