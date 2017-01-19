class CreateUserFlosses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_flosses do |t|
      t.references :user, foreign_key: true
      t.references :floss, foreign_key: true
      t.integer :floss_quantity, :default => 0

      t.timestamps
    end
  end
end
