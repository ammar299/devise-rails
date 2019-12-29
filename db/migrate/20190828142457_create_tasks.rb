class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
    	t.integer :user_id
    	t.integer :team_id
      t.integer :project_id
      t.string :name
      t.string :duration
      t.string :status
    	t.attachment :file_upload
      t.timestamps
    end
  end
end
