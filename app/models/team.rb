class Team < ApplicationRecord
	has_and_belongs_to_many :users :users

end