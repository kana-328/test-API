class PackagesController < ApplicationController

  def show
    @package = Package.find(params[:id])

  end

  def new
    @package = Package.new
  end

  def create
    @id = params[:photographer_id]
    @package = Package.new(package_params)
    @package.photographer_id = @id
    if @package.save
      flash[:success] = 'パッケージを登録しました'
      redirect_to photographer_path(id: @package.photographer_id)
    else
      render "new"
      flash[:danger] = '登録が失敗しました'
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    if @package.update_attributes(package_params)
      flash[:success] = "パッケージを編集しました"
      redirect_to photographer_path(id: @package.photographer_id)
    else
      render 'edit'
    end
  end

  def destroy
    package = Package.find_by(id: params[:id]).destroy
    flash[:notice] = 'パッケージを削除しました'
    redirect_to photographer_path(id: package.photographer_id)
  end
  
  def get_cities
    render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
  end

  private
    def package_params
      params.require(:package).permit(:title, :descript, :price, :prefecture_id, :city_id, { category_ids: [], images: [], day: []} )
    end
end
