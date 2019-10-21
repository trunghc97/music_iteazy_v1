class Liked < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  has_one :notification, as: :notifiable, dependent: :destroy

  validates_uniqueness_of :likeable_id, scope: [:user_id, :likeable_type]

  after_create_commit :create_notification

  private

  def create_notification
    @song = Song.find_by id: likeable_id

    return if user_id == @song.user_id
    Notification.create user_id: user_id, notifiable_id: id,
      notifiable_type: :Liked, recipient_id: @song.user_id
    ActionCable.server.broadcast "notification_channel_#{@song.user_id}", actor: user_id
  end
end
