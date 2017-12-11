class Icon < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :association_icons
end
