class AddCapacityPercentageToNightclubs < ActiveRecord::Migration[6.0]
  def change
    add_column :nightclubs, :capacity_percentage, :integer
  end
end
