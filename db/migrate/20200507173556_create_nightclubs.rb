class CreateNightclubs < ActiveRecord::Migration[6.0]
  def change
    create_table :nightclubs do |t|
      t.string :name
      t.string :style
      t.string :description
      t.integer :cheapest_lager
      t.integer :cheapest_mixer
      t.integer :cheapest_shot
      t.integer :price_house_wine
      t.integer :capacity
      t.integer :queue_time
      t.integer :entry_price
      t.integer :gender_mix
      t.boolean :promotion_available

      t.timestamps
    end
  end
end
