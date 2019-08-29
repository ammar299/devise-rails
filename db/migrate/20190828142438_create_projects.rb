class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
    	t.integer :team_id
    	t.string :name
    	t.integer :start_date
    	t.integer :end_date

      t.timestamps
    end
  end
end
