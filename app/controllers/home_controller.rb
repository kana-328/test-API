class HomeController < ApplicationController
  def index
    @package = Category.preload(:packages)
  end
end
