class EpisodesController < ApplicationController

  def show
    @episode      = Episode.find_by_id(params[:id])
    @events       = Event.where(episode_id: @episode.id).order(date: :desc)
    # @events = @episode.events.order(date: :desc)
    @appointment  = Event.new(category: "appointment")
    @note         = Event.new(category: "note")
    @episode_caregivers   = current_patient.caregivers.for_episode(@episode.id)
    @caregivers   = current_patient.caregivers
    @document     = Document.new
    @caregiver    = Caregiver.new
  end

  def index
    # better use of associations
    # Order episodes / date events la plus récente
    # Pas très efficace

    @episodes = current_patient.episodes.joins(:events).order("events.updated_at desc").to_a.uniq
    if params[:name]
      @episodes  = @current_patient.episodes.where("name ILIKE ?", "%#{params[:name]}%")
    end
    @episode = Episode.new
    @caregivers = current_patient.caregivers
    @caregiver = Caregiver.new
  end

  def chrono
    @events = Event.
      joins(:episode).
      where(episodes: { patient_id: current_patient.id }).
      order(date: :desc)
    @episodes     = current_patient.episodes
    @appointment  = Event.new(category: "appointment")
    @note         = Event.new(category: "note")
    @caregivers   = current_patient.caregivers
    @document     = Document.new
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode        = Episode.new(episode_params)
    @episode.patient = current_patient
    initial_event   = Event.new(category: "note", description: "Création de l'épisode #{@episode.name}", date: Date.today)
    @episode.events << initial_event
    if Picto.where("name ILIKE?", "%#{@episode.name}%") != []
      name = Picto.where("name ILIKE?", "%#{@episode.name}%").first.name
      @episode.icon = File.open(Rails.root.join("app/assets/images/icons/#{name}.png"))
    else
      @episode.icon = File.open(Rails.root.join("app/assets/images/icons/arm-1.png"))
    end

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
