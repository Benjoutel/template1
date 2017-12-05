class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :episodes, dependent: :destroy
  has_many :events, through: :episodes
  has_many :caregivers, dependent: :destroy
  has_many :measures, dependent: :destroy
  has_many :vaccinations, dependent: :destroy
  has_many :allergies, dependent: :destroy
  has_many :antecedents, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
