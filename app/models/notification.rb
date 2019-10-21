class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true
  belongs_to :recipient, class_name: User.name

  scope :ordered, ->{order created_at: :desc}
  scope :unread, ->{where(read: false).count}
end
