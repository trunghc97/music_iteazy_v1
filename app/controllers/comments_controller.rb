class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def create
    @song = Song.find_by id: params[:song_id]
    @comment = @song.comments.build comment_params

    respond_to do |format|
      format.html{redirect_to @song}
      if @comment.save
        format.js{flash.now[:notice] = t ".created"}
      else
        format.js{flash.now[:notice] = t ".failed"}
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html{redirect_to request.referrer || root_url}
      if @comment.destroy
        format.js{flash.now[:notice] = t ".destroy"}
      else
        format.js{flash.now[:notice] = t ".cant_destroy"}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge user: current_user
  end

  def correct_user
    @comment = Comment.find_by id: params[:id]
    @song = @comment.song
    return if current_user == @comment.user || current_user == @song.user
    redirect_to root_url
  end
end
