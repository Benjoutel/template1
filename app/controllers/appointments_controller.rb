class AppointmentsController < ApplicationController

  def new
    @episode = Episode.find(params[:episode_id])
    @appointment = Event.new(category: "appointment")
    # (category: "appointment")
    @caregivers = Caregiver.where(patient_id: @episode.patient_id)


  end


  def create
    @episode = Episode.find(params[:episode_id])
    #caregiver = Caregiver.find_by_lastname(appointment_params[:caregiver_id])
    # @appointment = Event.new(episode_id: @episode.id, caregiver_id: appointment_params[:caregiver_id] ,category:"appointment",  date: appointment_params[:date], description: appointment_params[:description])
    @appointment = Event.new(appointment_params)
    @appointment.episode = @episode
    @appointment.category = "appointment"
    if @appointment.save
      redirect_to episode_path(@episode)
    else
      render :new
    end
  end

  def edit
   @appointment = Event.find(params[:id])
   @caregivers = Caregiver.all
 end

 def update
   @appointment = Event.find(params[:id])
   @appointment.update(appointment_params)
   if @appointment.save
     redirect_to episode_path(@appointment.episode_id)
   else
   end
 end


 private

 def appointment_params
  params.require(:event).permit(:date, :description , :caregiver_id)
end
end
