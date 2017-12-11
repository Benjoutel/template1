class AssociationIcon < ApplicationRecord
  belongs_to :icon
  belongs_to :event, optional: true
  belongs_to :caregiver, optional: true
  belongs_to :episode, optional: true
end


