class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :name
      t.string :category
      t.float :latitude
      t.float :longitude
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
