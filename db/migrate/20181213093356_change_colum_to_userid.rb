class ChangeColumToUserid < ActiveRecord::Migration[5.2]
  def change
    remove_column :likeds, :song_id
    add_reference :likeds, :user, index: true
  end
end
