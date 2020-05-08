class Nightclub < ApplicationRecord
  belongs_to :address

  validates_uniqueness_of :name
end
