class EpisodesController < ApplicationController

  def show
    @episode = Episode.find_by_id(params[:id])
    @events = Event.where(episode_id: @episode.id).order(date: :desc)
  end

  def index
    @episodes = Episode.where(patient_id: current_patient.id)
    # joins events and order episodes by update date
  end

  def chrono
    @events = Event.
      joins(:episode).
      where(episodes: { patient_id: current_patient.id }).
      order(date: :desc)
  end


end
