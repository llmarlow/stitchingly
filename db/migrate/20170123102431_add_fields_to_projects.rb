class AddFieldsToProjects < ActiveRecord::Migration[5.0]
  def change
    change_table :projects do |t|
      t.string :pattern_name
      t.string :pattern_designer
      t.string :fabric_brand
      t.string :fabric_colour
      t.string :fabric_count
      t.string :thread_brand
    end
  end
end
