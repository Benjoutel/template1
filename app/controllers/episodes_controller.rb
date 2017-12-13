class EpisodesController < ApplicationController

  def show
    @episode = Episode.find_by_id(params[:id])
    @events  = @episode.events

    if params[:search]
      if params[:search] == "rendez-vous"
        params[:search] = "appointment"
      end
      @events = @events.search(params[:search]).reorder("")
    end

    if params[:category]
      @events = @events.
        joins('INNER JOIN documents ON documents.event_id = events.id'). # We have to force the table alias thanks to pg_search
        where(documents: { category: params[:category] })
    end

    if @events == []
      message = "Vous ne possédez pas de #{params[:category] || 'événement'} pour cet épisode"

      if params[:search]
        message += " avec le mot #{params[:search]}"
      end

      flash[:notice] = message
      return redirect_to episode_path(@episode)
    end

    # if params[:search] &&  params[:category] == nil
    #   # @episodes  = @current_patient.episodes.where("name ILIKE ?", "%#{params[:name]}%")
    #   @events = @events.search(params[:search]).reorder("")
    #   if @events == []
    #     redirect_to episode_path(@episode)
    #     flash[:notice] = "Vous ne possédez pas d'évènements pour cet épisode avec le mot #{params[:search]}"
    #   end
    # end

    # if params[:category] && params[:search] == nil
    #   # binding.pry
    #   @events = @events.joins(:documents).where("documents.category ILIKE ?", "%#{params[:category]}%")
    #   if @events == []
    #     redirect_to episode_path(@episode)
    #     flash[:notice] = "Vous ne possédez pas de #{params[:category]} pour cet épisode avec le mot "
    #   end
    # end

    # if params[:category] && params[:search]
    #   binding.pry
    #   @events = @events.search(params[:search]).reorder("")
    #   @events = @events.joins(:documents).where("documents.category ILIKE ?", "%#{params[:category]}%")
    #   # if @events == []
    #   #   redirect_to episode_path(@episode)
    #   #   flash[:notice] = "Vous ne possédez pas de #{params[:category]} pour cet épisode avec le mot "
    #   # end
    # end

    @events = @events.order(date: :desc)

    @appointment  = Event.new(category: "appointment")
    @note         = Event.new(category: "note")
    @episode_caregivers   = current_patient.caregivers.for_episode(@episode.id)
    @caregivers   = current_patient.caregivers
    @document     = Document.new
    @caregiver    = Caregiver.new
  end

  # /episodes/191?search=Greene&category=radio
  # /episodes/191?category=radio

  # episode_path(@episode, search: "Greene", category: "radio")
  # episode_path(@episode, category: "radio")

  def index
    # better use of associations
    # Order episodes / date events la plus récente
    # Pas très efficace

    @episodes = current_patient.episodes.joins(:events).order("events.updated_at desc").to_a.uniq
    if params[:name]
      if params[:name] != ''
      @episodes  = @current_patient.episodes.where("name ILIKE ?", "%#{params[:name]}%")
      else
        @episodes = current_patient.episodes.joins(:events).order("events.updated_at desc").to_a.uniq
      end
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
