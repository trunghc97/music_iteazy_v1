class Liked < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  has_many :notifications, as: :notifiable

  validates_uniqueness_of :likeable_id, scope: [:user_id, :likeable_type]

  after_create_commit :create_notification

  private

  def create_notification
    @song = Song.find_by id: likeable_id

    return if user_id == @song.user_id
    Notification.create user_id: user_id, notifiable_id: likeable_id,
      notifiable_type: :Liked
  end
end
