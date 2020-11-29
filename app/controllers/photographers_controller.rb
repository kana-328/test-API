class PhotographersController < ApplicationController

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
    params.require(:photographer).permit(:name, :descript, :address, :email, :image, :accepted)
  end
end
