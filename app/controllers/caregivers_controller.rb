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


private

  def caregiver_params
    params.require(:caregiver).permit(:firstname, :lastname, :address, :mail, :phone_number, :speciality, :photo)
  end
end



