class SongsController < ApplicationController
  before_action :find_song, only: :show
  def index
    @songs = Song.search_song(params[:search])
                 .page(params[:page]).per Settings.pages.per_page
  end

  def show
    @comments = @song.comments.ordered
                     .page(params[:page]).per Settings.pages.per_page
    @comment = current_user.comments.build if logged_in?
    @genres = @song.genres
    @playlist = current_user.playlists.order_desc if current_user
                                                     &.playlists&.any?
    @liked = @song.liked.find_by user_id: current_user.id if current_user
  end

  private

  def song_params
    params.require(:song).permit SONG_ATTRIBUTES
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_song
    @song = Song.include_to_song.find_by id: params[:id]
    redirect_to songs_url unless @song
  end
end
