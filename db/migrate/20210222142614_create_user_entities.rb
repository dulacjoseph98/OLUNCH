class CreateUserEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_entities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entity, null: false, foreign_key: true
      t.string :role
      t.integer :status

      t.timestamps
    end
  end
end
