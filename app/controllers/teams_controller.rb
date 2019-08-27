class TeamsController < ApplicationController

	before_action :authenticate_user!
	include TeamHelper
	def index
		ids = Membership.where(user_id: current_user.id).pluck(:team_id)
		@teams = Team.where.not(id: ids)
	end

	def joined
		@memberships = current_user.memberships
	end

	def join_team
		membership = Membership.create(team_id: params[:team_id], user_id: current_user.id, role: 'member')
		# ternary operator ruby
		membership.persisted? ? (redirect_to joined_user_teams_path(current_user)) : (redirect_to user_teams_path(current_user))
	end

	def join_requests
		admin_team_id = current_user.memberships.where(role: "admin").pluck(:team_id)
		@teams = Team.where(id: admin_team_id)
	end

	def approve_join_request
		membership = Membership.find_by(id: params[:membership_id])
		membership.update(is_approved: true)
		redirect_to joined_user_teams_path(current_user)
	end

	def decline_join_request
		membership = Membership.find_by(id: params[:membership_id])
		membership.destroy
		redirect_to join_requests_teams_path
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		if @team.save
			Membership.create(user_id: current_user.id, team_id: @team.id, role: 'admin', is_approved: true)
			flash[:notice] = "#{current_user.name || "You" } created #{@team.title} as Admin Role"
			redirect_to joined_user_teams_path(current_user)
		else
			render 'new'
		end
	end

	def show
		@team = Team.find_by(id: params[:id])
	end

	def edit
		@team = Team.find_by(id: params[:id])
	end

	def update
		@team = Team.find_by(id: params[:id])
		if @team.update(team_params)
			flash[:notice] = "team was updated"
			redirect_to joined_user_teams_path(current_user)
		else
			flash[:notice] = "team was not updated"
			render 'edit'
		end
	end

	def destroy
		@team = Team.find_by(id: params[:id])
		@team.destroy
		flash[:notice] = "team was deleted"
		redirect_to joined_user_teams_path(current_user)
	end

	private

	def team_params
		params.require(:team).permit(:title)
	end
end
