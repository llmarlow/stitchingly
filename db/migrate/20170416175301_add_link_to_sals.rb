class AddLinkToSals < ActiveRecord::Migration[5.0]
  def change
    add_column :sals, :link, :string
  end
end
