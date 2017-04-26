class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :text
    add_column :users, :birthday, :date
    add_column :users, :instagram, :string
    add_column :users, :website, :string
    add_column :users, :youtube, :string
  end
end
