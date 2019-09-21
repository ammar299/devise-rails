class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
		@team = Team.find_by(id: params[:team_id])
		@project = Project.find_by(id: params[:project_id])
	end

	def create 
		@task = Task.new(task_params)
		
		# @project = Project.find_by(id: params[:project_id]) ## alreay have projrct id params[:task][:project_id]
		# @task.project_id = @project.id
		# @team = Team.find_by(id: params[:team_id])
		# @task.team_id = @team.id
		if @task.save
			flash[:notice] = "task is created"
			redirect_to user_team_project_tasks_path(user_id: current_user.id, team_id: params[:team_id], project_id: params[:project_id])
		else
			render 'new'
		end
	end

	def show
		@task = Task.find_by(id: params[:id])

	end

	def update
		@task = Task.find_by(id: params[:id])
		if @task.update(task_params)
			flash[:notice] = "task was updated"
			redirect_to joined_user_tasks_path(current_user)
		else
			flash[:notice] = "task was not updated"
			render 'edit'
		end
	end

	def edit
		@task = Task.find_by(id: params[:id])
	end

	def destroy
		@task = Task.find_by(id: params[:id])
		@task.destroy
		flash[:notice] = "task was deleted"
		redirect_to joined_user_tasks_path(current_user)
	end

	private

	def task_params
		params.require(:task).permit(:name, :duration, :status, :project_id, :team_id, :user_id)
	end

end