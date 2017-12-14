class InvitationsController < ApplicationController

  def create
    # binding.pry
    @invitation = Invitation.new(invitation_params)
    @invitation.status = "Pending"
    @invitation.invitation_token = SecureRandom.uuid
    caregiver = Caregiver.find(invitation_params[:caregiver_id])
    episode   = Episode.find(invitation_params[:episode_id])
    if @invitation.save
      flash[:notice] = "Invitation envoyée à #{caregiver.firstname} #{caregiver.lastname}, #{caregiver.speciality} "
      # invite(caregiver, episode)
      redirect_to caregiver_path(invitation_params[:caregiver_id])
    else
      flash[:notice] = "Loupé"
      redirect_to caregiver_path(invitation_params[:caregiver_id])
    end

  end

  def invitation_params
    params.permit(:caregiver_id, :episode_id)
  end


end
