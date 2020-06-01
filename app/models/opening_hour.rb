class OpeningHour < ApplicationRecord
  belongs_to :nightclub

  # validates :day, inclusion: { in: (0..7).to_a }

  def is_num_of_week_open
    Date::DAYNAMES.find_index(num)
  end

  def day_of_week(num)
    case num
    when 0 then monday
    when 1 then tuesday
    when 2 then wednesday
    when 3 then thursday
    when 4 then friday
    when 5 then saturday
    when 6 then sunday
    end
  end
end
