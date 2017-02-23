class CreateFabrics < ActiveRecord::Migration[5.0]
  def change
    create_table :fabrics do |t|
      t.references :user
      t.string :brand
      t.string :colour
      t.integer :count
      t.decimal :height
      t.decimal :width

      t.timestamps
    end
  end
end
