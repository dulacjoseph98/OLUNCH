class AddDefaultValueToPublicInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :public, :boolean, null: false, default: false
  end
end
