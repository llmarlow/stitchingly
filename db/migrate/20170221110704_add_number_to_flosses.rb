class AddNumberToFlosses < ActiveRecord::Migration[5.0]
  def change
    add_column :flosses, :flossnumber, :string
  end
end
