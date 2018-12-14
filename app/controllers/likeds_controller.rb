class LikedsController < ApplicationController
  def create
    @song = Song.find_by id: params[:song_id]
    @likeable = @song.liked.new user_id: params[:user_id]

    if @likeable.save
      respond_to do |format|
        format.html{redirect_to @song}
        format.js
      end
    else
      redirect_to @song
    end
  end

  def destroy
    @song = Song.find_by id: params[:song_id]
    @likeable = @song.liked.find_by user_id: params[:user_id]

    if @likeable.destroy
      respond_to do |format|
        format.html{redirect_to @song}
        format.js
      end
    else
      redirect_to @song
    end
  end
end
