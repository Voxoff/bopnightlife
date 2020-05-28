class AddDefaultFalseToCode < ActiveRecord::Migration[6.0]
  def change
    change_column :codes, :activated, :boolean, default: :false
  end
end
