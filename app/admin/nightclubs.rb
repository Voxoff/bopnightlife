ActiveAdmin.register Nightclub do
  permit_params :name, :total_capacity, :style, :description, :cheapest_lager, :cheapest_mixer, :cheapest_shot, :price_house_wine, :capacity, :queue_time, :entry_price, :gender_mix, :promotion_available
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :total_capacity, :style, :description, :cheapest_lager, :cheapest_mixer, :cheapest_shot, :price_house_wine, :capacity, :queue_time, :entry_price, :gender_mix, :promotion_available, :address_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
