ActiveAdmin.register Address do
  permit_params :first_line, :second_line, :city, :postcode
end
