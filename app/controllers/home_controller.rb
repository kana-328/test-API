class HomeController < ApplicationController
  def index
    @category = Category.all
    @package = Package.includes(:categories).where(packages_and_categories: { category_id: @category })
  end
end
