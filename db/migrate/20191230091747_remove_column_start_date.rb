class RemoveColumnStartDate < ActiveRecord::Migration[6.0]
  def change
  	remove_column :projects, :start_date
  	remove_column :projects, :end_date
  end
end
