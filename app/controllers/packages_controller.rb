class PackagesController < ApplicationController
  def new
    @package = Package.new
  end

  def create

  end

  private
    def package_params
      params.require(:package).permit(:title, :descript, :day, {image: []})
    end
end
