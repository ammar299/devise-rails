class Team < ApplicationRecord
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	has_one :project
end