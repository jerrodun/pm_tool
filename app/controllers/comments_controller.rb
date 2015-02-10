class CommentsController < ApplicationController

  def new
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.new
  end

  def create
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save

      Usermailer.commentcreated_email(@comment).deliver
      redirect_to new_discussion_comment_path(@discussion)
    end
  end



  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.find(params[:id])
  end

  def update 
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to new_discussion_comment_path
    else
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to new_discussion_comment_path
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :description)
  end

end




