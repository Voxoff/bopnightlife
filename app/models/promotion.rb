class Promotion < ApplicationRecord
  belongs_to :nightclub
  has_many :codes

  scope :active, -> { where(active: true)}

  validates :description, presence: :true
end
