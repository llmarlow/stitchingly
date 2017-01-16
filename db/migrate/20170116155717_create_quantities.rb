class CreateQuantities < ActiveRecord::Migration[5.0]
  def change
    create_table :quantities do |t|
      t.references :user, foreign_key: true
      t.references :floss, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end
