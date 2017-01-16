class CreateFlosses < ActiveRecord::Migration[5.0]
  def change
    create_table :flosses do |t|
      t.string :colour
      t.timestamps
    end
  end
end
