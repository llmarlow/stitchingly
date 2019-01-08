class AddSocialToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :blog, :string
    add_column :users, :shop, :string
    add_column :users, :twitter, :string
    add_column :users, :twitch, :string
  end
end
