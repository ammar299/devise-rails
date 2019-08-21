class CreateUserTeams < ActiveRecord::Migration[6.0]
  def change

  # If you want to add an index for faster querying through this join:
  	create_table :user_teams do |t|
    	t.integer :user_id
    	t.integer :team_id
  	end

  end
end
