class ProjectsController < ApplicationController
	def index
		
		@projects = Project.all
	end

	def new
		@team = Team.find_by(id: params[:team_id])
		@project = Project.new
	end

	def create
		@team = Team.find_by(id: params[:team_id])
		@project = Project.new(project_params)
		@project.team_id = @team_id
		if @project.save
			flash[:notice] = "project was created"
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def show
		@project = Project.find_by(id: params[:id])
	end

	def update
		@project = Project.find_by(id: params[:id])
		if @project.update(project_params)
			flash[:notice] = "project was updated"
			redirect_to joined_user_projects_path(current_user)
		else
			flash[:notice] = "project was not updated"
			render 'edit'
		end
	end

	def edit
		@project = Project.find_by(id: params[:id])
	end

	def destroy
		@project = Project.find_by(id: params[:id])
		@project.destroy
		flash[:notice] = "project was deleted"
		redirect_to joined_user_projects_path(current_user)
	end

	private

	def project_params
		params.require(:project).permit(:name, :start_date, :end_date)
	end

end