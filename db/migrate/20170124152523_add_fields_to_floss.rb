class AddFieldsToFloss < ActiveRecord::Migration[5.0]
  def change
    add_column :flosses, :brand, :string
    add_column :flosses, :floss_type, :string
  end
end
