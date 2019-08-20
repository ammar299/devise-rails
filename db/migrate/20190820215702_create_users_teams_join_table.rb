class CreateUsersTeamsJoinTable < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :users, :teams

  # If you want to add an index for faster querying through this join:
  	create_join_table :users, :teams do |t|
    	t.index :user_id
    	t.index :teams_id
  	end
  end
end
