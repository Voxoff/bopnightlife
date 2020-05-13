class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.references :nightclub, null: false, foreign_key: true
      t.boolean :active, default: false
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
