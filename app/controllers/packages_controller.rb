class PostsController < ApplicationController
  require "json"

  def show
    @post = Post.find(params[:id])
    @day = JSON.parse(@post.day)
  end

  def new
    @post= Post.new
  end

  def create
    @id = params[:photographer_id]
    @post = Post.new(post_params)
    @post.photographer_id = @id
    if @post.save
      flash[:success] = 'パッケージを登録しました'
      redirect_to photographer_path(id: @post.photographer_id)
    else
      render "new"
      flash[:danger] = '登録が失敗しました'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "パッケージを編集しました"
      redirect_to photographer_path(id: @post.photographer_id)
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find_by(id: params[:id]).destroy
    flash[:notice] = 'パッケージを削除しました'
    redirect_to photographer_path(id: post.photographer_id)
  end
  
  def get_cities
    render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
  end

  private
    def post_params
      params.require(:post).permit(:title, :descript, :price, :prefecture_id, :city_id, { category_ids: [], images: [], day: []} )
    end
end
