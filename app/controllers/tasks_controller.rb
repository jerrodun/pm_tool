class TasksController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end


  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to new_project_task_path(@project)
    end
  end


  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to new_project_task_path
    else
      render "edit"
    end
  end


def task_params
    params.require(:task).permit(:id, :description, :title)
  end




end
