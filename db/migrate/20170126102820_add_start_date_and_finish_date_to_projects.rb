class AddStartDateAndFinishDateToProjects < ActiveRecord::Migration[5.0]
  def change
     add_column :projects, :start_date, :date
     add_column :projects, :finish_date, :date
  end
end
