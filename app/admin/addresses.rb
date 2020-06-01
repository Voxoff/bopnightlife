ActiveAdmin.register Address do
  actions :all, except: [:new]

  permit_params :first_line, :second_line, :city, :postcode

  # form do |f|
  #   f.semantic_errors *f.object.errors.keys
  #   f.input :nightclub, as: :select, collection: Nightclub.includes(:address).where(address: { nightclub_id: nil }).to_a
  #   f.input :first_line
  #   f.input :second_line
  #   f.input :city
  #   f.input :postcode
  #   f.actions
  # end
end
