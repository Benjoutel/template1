class CaregiversController < ApplicationController

  def create

  end


private

  def note_params
      params.require(:caregiver).permit(:firstanme, :lastname )
  end
end
