class Task < ApplicationRecord
	belongs_to :project
	has_one :user
end
