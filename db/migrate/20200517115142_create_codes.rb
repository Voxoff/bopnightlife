class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.references :promotion, null: false, foreign_key: true
      t.string :code
      t.integer :ip_address

      t.timestamps
    end
  end
end
