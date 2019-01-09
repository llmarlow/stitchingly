class AddCompletedToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :completed, :boolean, null: false, default: false
  end
end
