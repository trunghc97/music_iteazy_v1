class Song < ApplicationRecord
  SONG_ATTRIBUTES = %i(singer_id title lyrics song_url view img_url user_id)
                    .push(singer_attributes: %i(name description)).freeze

  belongs_to :user
  belongs_to :singer, optional: true
  accepts_nested_attributes_for :singer, reject_if: :all_blank
  has_many :liked, as: :likeable
  has_many :comments, dependent: :destroy
  has_many :view_logs
  has_many :genre_songs, dependent: :destroy
  has_many :genres, through: :genre_songs
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  include PgSearch

  mount_uploader :img_url, ImgUrlUploader
  mount_uploader :song_url, SongUrlUploader

  validates :title, presence: true,
    length: {maximum: Settings.title.max_length}
  validates :song_url, presence: true
  validates :view, numericality: true
  validate :img_size
  validate :song_size

  scope :include_to_song, ->{includes :singer, :comments, :genres}
  scope :hot_feed, ->{order view: :desc}
  scope :order_new , ->{order created_at: :desc}
  scope :search_index, lambda{|search|
    if search
      search_by_full_name(search).hot_feed
    else
      hot_feed
    end
  }

  delegate :name, to: :singer, allow_nil: true

  pg_search_scope :search_by_full_name, against: :title

  private

  def img_size
    return if img_url.size <= Settings.file_size.megabytes
    errors.add :img_url, I18n.t(".out_of_size")
  end

  def song_size
    return if song_url.size <= 10.megabytes
    errors.add :song_url, I18n.t(".out_of_size_song")
  end
end
