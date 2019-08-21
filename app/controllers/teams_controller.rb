class TeamsController < ApplicationController

	before_action :authenticate_user!

	def index
		# join table records ids
		ids = current_user.teams.pluck(:id)
    @teams = Team.where(id: ids)
  end

	def new
		@team = Team.new
	end

	def create
		@team = current_user.teams.new(team_params)
		if @team.save
			UserTeam.create(user_id: current_user.id, team_id: @team.id)
			flash[:notice] = "Team was successfully created"
			redirect_to user_team_path(current_user, @team)
		else
			reder 'new'
		end
	end

	def show
    @team = Team.find_by(id: params[:id])
  end

  def edit
  	@team = Team.find(params[:id])
	end

	def update
  	@team = Team.find_by(id: params[:id])
  	if @team.update(team_params)
   		flash[:notice] = "team was updated"
   		redirect_to user_team_path(current_user, @team)
  	else
   		flash[:notice] = "team was not updated"
   		render 'edit'
  	end
	end

	def destroy
  	@team = Team.find(params[:id])
  	@team.destroy
  	flash[:notice] = "team was deleted"
  	redirect_to user_teams_path(user_id: current_user.id)
 	end

	private

	def team_params
		params.require(:team).permit(:title, :member, :role)
	end
end
