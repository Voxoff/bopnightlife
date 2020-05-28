class AddActivatedToCodes < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :activated, :boolean
  end
end
