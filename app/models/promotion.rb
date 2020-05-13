class Promotion < ApplicationRecord
  belongs_to :nightclub

  scope :active, -> { where(active: true)}
end
