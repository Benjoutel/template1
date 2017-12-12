class CaregiversController < ApplicationController

  def create
    @caregiver = Caregiver.new(caregiver_params)
    @caregiver.patient = current_patient
    if @caregiver.save
      redirect_to episodes_path
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
end



