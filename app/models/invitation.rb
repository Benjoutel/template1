class Invitation < ApplicationRecord
  belongs_to :episode
  belongs_to :caregiver
  belongs_to :specialist, optional: true
  validates :invitation_token, uniqueness: true, allow_nil: true
end
