class EpisodesController < ApplicationController
  
  
  def show
    @episode = Episode.find_by_id(params[:id])
    @events = Event.where(episode_id: @episode.id).order(date: :desc)
  end

end
