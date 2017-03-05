class AddPictureToSals < ActiveRecord::Migration[5.0]
  def change
    add_column :sals, :picture, :string
  end
end
