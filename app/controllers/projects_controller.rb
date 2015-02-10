class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    

  end

  def new
    @projects = Project.new

  end

  def create #no view
    @projects = Project.new(project_params)
    uploaded_io = params[:project][:doc]
    if @projects.save
      redirect_to projects_path, :notice => "Your project was sent!"
    else 
      render "new"
    end
  end
    
  def edit
    @projects = Project.find(params[:id])
  end

  def update #no view
    @projects = Project.find(params[:id])

    if @projects.update_attributes(project_params)
      redirect_to projects_path, :notice => "Your project has been updated."
    else
      render "edit"
    end
  end

  def destroy #no view
    @projects = Project.find(params[:id])
    @projects.destroy
    redirect_to projects_path, :notice => "Your project has been deleted."
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end


end
