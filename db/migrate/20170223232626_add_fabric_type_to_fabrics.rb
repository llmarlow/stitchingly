class AddFabricTypeToFabrics < ActiveRecord::Migration[5.0]
  def change
    add_column :fabrics, :fabric_type, :string
  end
end
