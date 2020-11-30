class HomeController < ApplicationController
  def index
    @search = Category.preload(:packages).ransack(params[:q])
    @packages = @search.result
  end
end
