class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
    	t.string :title
      t.timestamps
    end
  end
end