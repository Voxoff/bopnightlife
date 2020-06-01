ActiveAdmin.register Promotion do
  permit_params :description, :nightclub_id, :active
  includes(:nightclub)
end
