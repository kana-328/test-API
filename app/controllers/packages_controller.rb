class PackagesController < ApplicationController
  def new
    @package = Package.new
  end

  def create
    @id = params[:photographer_id]
    @package = Package.new(package_params)
    @package.photographer_id = @id
    if @package.save
      flash[:notice] = 'パッケージを登録しました'
      redirect_to photographer_path(id: @package.photographer_id)
    else
      render "new"
      flash[:danger] = '登録が失敗しました'
    end
  end

  private
    def package_params
      params.require(:package).permit(:title, :descript, :day, :price,  {image: [], category_ids: []} )
    end
end
