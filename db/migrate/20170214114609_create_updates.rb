class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.string :picture
      t.date :update_date
      t.integer :hours
      t.references :project
      t.timestamps
    end
  end
end
