class AddImgAndUserToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :img_url, :string
    add_reference :songs, :user, default: 1, index: true
  end
end
