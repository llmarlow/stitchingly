class AddTagToSals < ActiveRecord::Migration[5.0]
  def change
    add_reference :sals, :tag, foreign_key: true
  end
end
