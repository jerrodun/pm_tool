class LikesController < ApplicationController
  
  def create
    comment  = Comment.find params[:comment_id]
    like      = comment.likes.new
    like.user = current_user
    if like.save
      redirect_to new_discussion_comment_path(comment.discussion), notice: "Liked!"
    else
      redirect_to new_discussion_comment_path(comment.discussion), alert: "Liked Already!"
    end
  end

  def destroy
    comment = Comment.find params[:comment_id]
    like    = comment.likes.find params[:id]
    if like.destroy
      redirect_to new_discussion_comment_path(comment.discussion), notice: "UnLiked!"
    else
      redirect_to new_discussion_comment_path(comment.discussion), alert: "Can't UnLike!"
    end
  end


end
