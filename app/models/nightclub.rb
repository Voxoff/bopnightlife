class Nightclub < ApplicationRecord
  belongs_to :address
  has_many :promotions
  has_many :opening_hours
  has_one_attached :photo

  validates_uniqueness_of :name

  def gender_mix_string
    self.gender_mix || "Hold tight..."
  end

  def queue_time_string
    queue_time ? queue_time.to_s + " mins" : "Hold tight..."
  end

  def recently_updated?
    self.updated_at >= 10.minutes.ago
  end

  def present_address
    "#{address.first_line}, #{address.postcode}"
  end

  def name_as_html_id
    name.gsub(" ", "-")
  end

  def opening_days_of_week
    opening_hours.pluck(:day)
  end
end
