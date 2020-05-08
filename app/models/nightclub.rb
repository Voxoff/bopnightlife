class Nightclub < ApplicationRecord
  belongs_to :address

  has_one_attached :photo

  validates_uniqueness_of :name
end
