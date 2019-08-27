module TeamHelper

	def is_team_admin?(team, user)
		admin = Membership.where(team: team, user: current_user, role: 'admin')
		admin.blank? ? false : true 
	end

	def member_team(team , user)
		membr_id = current_user.memberships.where(role: "member").pluck(:team_id)
		@mem = Team.where(id: membr_id)
	end

end
