class CreateSals < ActiveRecord::Migration[5.0]
  def change
    create_table :sals do |t|
      t.string :name
      t.string :company
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
