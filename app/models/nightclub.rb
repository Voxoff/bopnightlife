class Nightclub < ApplicationRecord
  belongs_to :address
  has_many :promotions
  has_one_attached :photo

  validates_uniqueness_of :name

  def gender_mix_string
    self.gender_mix || "??"
  end

  def queue_time_string
    queue_time ? queue_time.to_s + " mins" : "We're getting there"
  end

  # def promotion_available?
  #   bool = super
  #   bool ? "Yup" : "Nothing right now"
  # end

  # def any_promotions?

  # end
end
