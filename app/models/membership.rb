class	Membership < ApplicationRecord
	
	belongs_to :user
	belongs_to :team
	enum role: { admin: 'admin', manager: 'manager', lead: 'lead', member: 'member' }

end