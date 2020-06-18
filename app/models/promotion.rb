class Promotion < ApplicationRecord
  belongs_to :nightclub
  has_many :codes, dependent: :destroy

  scope :active, -> { where(active: true) }

  validates :description, presence: :true
end
