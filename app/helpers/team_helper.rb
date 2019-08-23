module TeamHelper

	def is_team_admin?(team, user)
		admin = Membership.where(team: team, user: current_user, role: 'admin')
		admin.blank? ? false : true 
	end

end
