class AddBetaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :beta_tester, :boolean, null: false, default: false
  end
end
