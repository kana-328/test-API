class PackagesController < ApplicationController
  def new
    @package = Package.new
  end

  def create

  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
