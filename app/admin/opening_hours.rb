ActiveAdmin.register OpeningHour do

  permit_params :nightclub_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
end
