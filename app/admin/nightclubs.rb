ActiveAdmin.register Nightclub do
  permit_params :name, :total_capacity, :style, :description, :cheapest_lager, :cheapest_mixer, :cheapest_shot, :price_house_wine, :capacity, :queue_time, :entry_price, :gender_mix, :promotion_available, :photo

  # index do
  #    selectable_column
  #   id_column
  # end

  menu priority: 1

  form do |f|
    f.semantic_errors
    f.inputs "Live" do
      f.input :queue_time
      f.input :entry_price
      f.input :gender_mix
      f.input :promotion_available
    end
    f.inputs "Static" do
      f.input :capacity
      f.input :description
      f.input :cheapest_shot
      f.input :cheapest_mixer
      f.input :cheapest_lager
      f.input :price_house_wine
    end
    f.inputs "Photo", :multipart => true do
      f.input :photo, :as => :file, :hint => cl_image_tag(f.object.photo.key, width: "100", height: "100"), label: 'Photo (forced into 100x100). Current image:'
    end
    f.actions
  end
end
