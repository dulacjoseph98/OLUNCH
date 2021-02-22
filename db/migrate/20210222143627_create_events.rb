class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :location, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :start_at
      t.boolean :public
      t.integer :capacity

      t.timestamps
    end
  end
end
