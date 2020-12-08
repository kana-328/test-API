class HomeController < ApplicationController
  def index
    category = Category.eager_load(:posts)
    @posts = category.as_json(:include => {:posts => {:only => [:id, :title]}})
    render json: @post
  end
end

