ActiveAdmin.register Nightclub do
  permit_params :name,
               :total_capacity,
               :style,
               :description,
               :cheapest_lager,
               :cheapest_mixer,
               :cheapest_shot,
               :price_house_wine,
               :capacity,
               :queue_time,
               :entry_price,
               :gender_mix,
               :promotion_available,
               :photo,
               address_attributes: [:first_line, :second_line, :city, :postcode]

  includes(:address)

  batch_action "Change Queue Times For", form: {
    queue_time: :text
  } do |ids, input|
    batch_action_collection.find(ids).each do |nightclub|
      nightclub.update(queue_time: input["queue_time"])
    end
    redirect_to collection_path, notice: "The queue_time has been changed to #{input["queue_time"]}."
  end

  menu priority: 1

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Live" do
      f.input :queue_time
      f.input :entry_price
      f.input :gender_mix
    end
    f.has_many :address do |address|
      address.inputs "Address" do
        address.input :first_line
        address.input :second_line
        address.input :city
        address.input :postcode
      end
    end
    f.has_many :promotions do |promotions|
      promotions.inputs "Promotion" do
        promotions.input :description
        promotions.input :active
      end
    end
    f.inputs "Static" do
      f.input :name
      f.input :style
      f.input :capacity
      f.input :description
      f.input :cheapest_shot
      f.input :cheapest_mixer
      f.input :cheapest_lager
      f.input :price_house_wine
    end
    f.inputs "Photo", :multipart => true do
      if f.object.photo.attached?
        f.input :photo, :as => :file, :hint => cl_image_tag(f.object&.photo&.key, width: "100", height: "100"), label: 'Photo (forced into 100x100). Current image:'
      else
        f.input :photo, :as => :file, label: 'Photo (forced into 100x100). Current image:'
      end
    end
    f.actions
  end
end
