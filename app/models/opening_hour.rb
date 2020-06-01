class OpeningHour < ApplicationRecord
  belongs_to :nightclub

  validates :day, inclusion: { in: (0..7).to_a }

  def day_of_week
    Date::DAYNAMES[self.day]
  end

  def first_letter_of_day_of_week
    day_of_week.first
  end
end
