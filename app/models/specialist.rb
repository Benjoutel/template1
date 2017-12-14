class Specialist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :invitations
  has_many :episodes, through: :invitations
  has_many :patients, -> { distinct }, through: :episodes
  # et penser a mettre un  -> { distinct }
end

