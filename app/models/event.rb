class Event < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :association_icons
  belongs_to :episode
  belongs_to :caregiver, optional: true
end
