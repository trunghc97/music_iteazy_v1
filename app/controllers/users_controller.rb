class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(edit update destroy)

  def show
    @playlists = current_user.playlists
                             .page(params[:page]).per Settings.per_page
    @songs = current_user.songs.page(params[:page]).per Settings.per_page
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
