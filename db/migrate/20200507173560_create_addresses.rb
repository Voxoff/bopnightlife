class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_line
      t.string :second_line
      t.string :city
      t.string :postcode
      t.references :nightclub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
