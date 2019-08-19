class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
    	t.string :country
  		t.string :city

      t.timestamps
    end
  end
end
