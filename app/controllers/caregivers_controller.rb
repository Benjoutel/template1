class CaregiversController < ApplicationController

  def create
    @caregiver = Caregiver.new(caregiver_params)
    @caregiver.patient = current_patient

    if @caregiver.save
      if @caregiver.photo.url.nil?
        @caregiver.photo = File.open(Rails.root.join("app/assets/images/doctor-green.png"))
        @caregiver.save
      end
      if caregiver_hidden_params[:from] == "index"
        redirect_to episodes_path
      else
        event = Event.new(category: "appointment", description: "Ajout de l'épisode #{@caregiver.firstname} #{@caregiver.lastname}, #{@caregiver.speciality}", date: Date.today)
        episode = Episode.find(params[:episode_id])
        event.episode = episode
        event.caregiver = @caregiver
        event.save
        redirect_to episode_path(episode)
      end
    else
      render :new
    end
  end

  def show
    @caregiver = Caregiver.find(params[:id])
    @episodes = current_patient.episodes.joins(:events).where("events.caregiver_id = ?", @caregiver.id).to_a.uniq
  end



private

  def caregiver_params
    params.require(:caregiver).permit(:firstname, :lastname, :address, :mail, :phone_number, :speciality, :photo)
  end

  def caregiver_hidden_params
    params.require(:caregiver).permit(:from)
  end
end



