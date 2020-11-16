class PackagesController < ApplicationController
  def new
    @packages = Package.new
  end
end
