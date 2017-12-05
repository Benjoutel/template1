class EpisodesController < ApplicationController


def index
  @episodes = Episode.all
end








private

def episode_params
  params.require(:episode).permit(:name, :created_at, :updated_at)
end



end
