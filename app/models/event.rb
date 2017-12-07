class Event < ApplicationRecord
  has_many :documents, dependent: :destroy
  belongs_to :episode
  belongs_to :caregiver, optional: true
end
