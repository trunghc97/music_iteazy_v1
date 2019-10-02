class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :content, presence: true,
    length: {maximum: Settings.content.max_length}
  validates :user_id, presence: true
  validates :song_id, presence: true

  after_create_commit :create_notification

  scope :ordered, ->{order created_at: :desc}

  private

  def create_notification
    @song = Song.find_by id: song_id

    return if user_id == @song.user_id
    notification = Notification.create user_id: user_id, notifiable_id: song_id,
      notifiable_type: :Comment, recipient_id: @song.user_id
    ActionCable.server.broadcast "notification_channel_#{@song.user_id}", actor: user_id
  end
end
