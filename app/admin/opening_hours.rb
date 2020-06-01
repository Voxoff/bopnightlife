ActiveAdmin.register OpeningHour do

  permit_params :nightclub_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.input :nightclub, as: :select, collection: Nightclub.includes(:opening_hour).where(opening_hours: { nightclub_id: nil }).to_a
    f.input :monday
    f.input :tuesday
    f.input :wednesday
    f.input :thursday
    f.input :friday
    f.input :saturday
    f.input :sunday
    f.actions
  end
end
