class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
    	t.memo :country
  		t.memo :city

      t.timestamps
    end
  end
end
