class PhotographersController < ApplicationController
  before_action :logged_in_photographer, only: [:edit, :update]
  before_action :correct_photographer, only: [:edit, :update]
  
  def show
    @photographer = Photographer.find(params[:id])
    @packages = @photographer.packages.page(params[:page])
  end

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
    if @photographer.save
      flash[:notice] = 'カメラマン情報を登録しました'
      log_in @photographer
      redirect_to @photographer
    else
      render "new"
      flash[:danger] = '登録が失敗しました'
    end
  end

  def edit
    @photographer = Photographer.find(params[:id])
  end

  def update
    @photographer = Photographer.find(params[:id])
    if @photographer.update_attributes(photographer_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @photographer
    else
      render 'edit'
      flash[:danger] = "プロフィールを更新に失敗しました"
    end
  end

  private

  def photographer_params
    params.require(:photographer).permit(:name, :descript, :address, :email, :image, :accepted, :password, :password_confirmation)
  end
  #ログイン済みユーザーか確認
  def logged_in_photographer
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to new_session_path
    end
  end

  #正しいユーザーかどうか確認
    def correct_photographer
      @photographer = Photographer.find(params[:id])
      redirect_to(root_url) unless current_photographer?(@photographer)
    end
end
