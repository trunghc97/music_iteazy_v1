class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i(index)

  def index
    @notifications = current_user.notifications.ordered
    @unread = @notifications.unread
  end

  def update
    @notification = Notification.find_by id: params[:id]
    @notification.update read: true
    redirect_to song_path(@notification.notifiable.likeable.id)
  end
end
