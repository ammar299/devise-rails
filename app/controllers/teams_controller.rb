class TeamsController < ApplicationController
	def index
    @teams = Team.all
  end

	def new
		@team = current_user.teams.new
	end

	def create
		@team = current_user.teams.new(team_params)
		if @team.save
			flash[:notice] = "Team was successfully created"
			redirect_to user_team_path(:user_id , :id)
		else
			reder 'new'
		end
	end

	def show
    @team = Team.find(params[:id])
  end

  def edit
  	@team = Team.find(params[:id])
	end

	def update
  	@team = team.find(params[:id])
  	if @team.update(team_params)
   		flash[:notice] = "team was updated"
   		redirect_to team_path(@team)
  	else
   		flash[:notice] = "team was not updated"
   		render 'edit'
  	end
	end

	def destroy
  	@team = Team.find(params[:id])
  	@team.destroy
  	flash[:notice] = "team was deleted"
  	redirect_to users_teams_path(user_id: current_user.id)
 	end

	private

	def team_params
		params.require(:team).permit(:title, :member, :role)
	end
end
