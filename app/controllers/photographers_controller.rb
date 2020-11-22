class PhotographersController < ApplicationController


  def show
    @photographer = Photographer.find(params[:id])
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


  private

  def photographer_params
    params.require(:photographer).permit(:name, :descript, :address, :email, :image, :accepted)
  end
end
