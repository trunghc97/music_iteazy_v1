class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :find_user, only: :show

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    @playlists = @user.playlists.page(params[:page]).per Settings.per_page

    return if @user
    flash[:info] = t ".not_found"
    redirect_to root_path
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      flash[:info] = t ".success"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t "not_found"
    redirect_to root_path
  end
end
