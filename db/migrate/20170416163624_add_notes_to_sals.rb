class AddNotesToSals < ActiveRecord::Migration[5.0]
  def change
    add_column :sals, :notes, :text
  end
end
