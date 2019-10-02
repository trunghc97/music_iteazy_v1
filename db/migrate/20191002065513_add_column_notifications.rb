class AddColumnNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :read, :boolean, default: false
    add_column :notifications, :recipient_id, :integer
  end
end
