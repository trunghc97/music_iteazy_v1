module ApplicationHelper
  def show_notifications
    songs = current_user.songs.ids
    @notifications = []
    songs.each do |s|
      @notifications.concat Notification.user_noti s
    end
    @notifications = @notifications.sort.reverse.first Settings.max_noti
  end
end
