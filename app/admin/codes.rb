ActiveAdmin.register Code do
  permit_params :activated

  config.per_page = [50, 100]

  filter :code, as: :string

  batch_action :activate_code do |ids|
    batch_action_collection.find(ids).each do |promo|
      promo.activate
    end
    redirect_to collection_path, notice: "Those codes have been activated."
  end

  controller do
    def scoped_collection
      super.includes promotion: :nightclub
    end
  end
  index do
    selectable_column
    column :nightclub do |n|
      n.promotion.nightclub.name
    end
    column :promotion_id do |code|
      "##{code.promotion.id} (#{code.promotion.description})"
    end
    column :code
    column :activated
    column :created_at do |code|
      code.created_at.strftime("%H:%M %A %b %d")
    end
    actions
  end

  form do |f|
    f.semantic_errors
    # f.inputs
    f.input :activated
    f.actions
  end
end
