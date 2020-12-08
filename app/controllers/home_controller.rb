class HomeController < ApplicationController
  def index
    category = Category.eager_load(:packages)
    @packages = category.as_json(:include => {:packages => {:only => [:id, :title]}})
    render json: @packages
  end
end

