class EpisodesController < ApplicationController
  skip_before_action :authenticate_patient!, only: [:index, :show]
  def show
    @episode = Episode.find_by_id(params[:id])
    @events = Event.where(episode_id: @episode.id).order(date: :desc)
  end

end
