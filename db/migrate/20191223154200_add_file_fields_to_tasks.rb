class AddFileFieldsToTasks < ActiveRecord::Migration[6.0]
	def self.up
    change_table :tasks do |t|
      t.attachment :filedfields
    end
  end
  def self.down
    remove_attachment :tasks, :filedfields
  end

end

