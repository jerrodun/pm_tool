
class DiscussionsController < ApplicationController

  before_action :find_project, except: [:destroy]

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = @project.discussions.build(discussion_params)
    if @discussion.save
      redirect_to new_project_discussion_path(@project)
    end
  end

  def edit
    @discussion = @project.discussions.find(params[:id])
  end

  def update
    @discussion = @project.discussions.find(params[:id])
    if @discussion.update_attributes(discussion_params)
      redirect_to new_project_discussion_path
    else
      render "edit"
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    redirect_to projects_path
  end


  private

  def discussion_params
    params.require(:discussion).permit(:title, :description)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
  
end