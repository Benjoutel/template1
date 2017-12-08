class EpisodesController < ApplicationController

  def show
    @episode     = Episode.find_by_id(params[:id])
    @events      = Event.where(episode_id: @episode.id).order(date: :desc)
    @appointment = Event.new(category: "appointment")
    @note        = Event.new(category: "note")
    @caregivers  = Caregiver.where(patient_id: @episode.patient_id).where.not(firstname: "Note")

  end

  def index

    @episodes    = current_patient.episodes

    if params[:name]
      @episodes  = @episodes.where("name ILIKE ?", "%#{params[:name]}%")
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
    @episode       = Episode.new(name: episode_params[:name], description: episode_params[:description], patient_id: current_patient.id)
    initial_event = Event.new(category: "note", description: "Création de l'épisode #{@episode.name}", caregiver: Caregiver.first, date: Date.today)
    @episode.events << initial_event
    if @episode.save
      redirect_to episodes_path
    else
      render :new
    end



  end

def episode_params
    params.require(:episode).permit(:name, :description)
  end

end
