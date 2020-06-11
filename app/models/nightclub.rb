class Nightclub < ApplicationRecord
  has_one :address, dependent: :destroy, required: true
  has_many :promotions, dependent: :destroy
  has_one :opening_hour, dependent: :destroy, required: true

  has_one_attached :photo

  accepts_nested_attributes_for :address, reject_if: :all_blank
  accepts_nested_attributes_for :promotions
  accepts_nested_attributes_for :opening_hour


  validates :name, :description, presence: true
  validates_uniqueness_of :name

  def queue_time_string
    queue_time ? queue_time.to_s + " mins" : "?"
  end

  def gender_mix_string
    self.gender_mix.to_s + "%"
  end

  def current_capacity_string
    self.current_capacity.to_s + "%"
  end

  def capacity_percentage_string
    self.capacity_percentage.to_s + "%"
  end

  def live_data?
    queue_time || gender_mix || capacity_percentage
  end

  def recently_updated?
    self.updated_at >= 10.minutes.ago
  end

  def present_address
    "#{address.first_line}, #{address.postcode}"
  end

  def name_as_html_id
    name&.gsub(" ", "-")
  end

  def open_on_this_day?(num)
    opening_hour&.day_of_week(num)
  end
end
