class Supports::SongSupport
  attr_reader :song, :user, :page

  def initialize song, user, page
    @song = song
    @user = user
    @page = page
  end

  def comments
    @song.comments.ordered.page(@page).per Settings.pages.per_page
  end

  def liked
    @liked ||= @song.liked.find_by user_id: @user.id if @user
  end

  def list_songs
    @list_songs ||= @song.singer.songs.first Settings.list_song
  end

  def genres
    @song&.genres
  end
end
