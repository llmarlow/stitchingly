class AddPremiumMemberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :premium_member, :boolean, null: false, default: false
  end
end
