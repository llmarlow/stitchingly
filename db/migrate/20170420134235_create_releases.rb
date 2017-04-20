class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :name
      t.string :picture
      t.references :sal, foreign_key: true

      t.timestamps
    end
  end
end
