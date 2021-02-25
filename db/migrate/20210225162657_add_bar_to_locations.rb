class AddBarToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :bar, :boolean, null: false, default: false
  end
end
