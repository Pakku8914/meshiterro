class PostImagesController < ApplicationController

  def new
    #画像投稿の画面を表示するアクションメソッド
    @post_image = PostImage.new
  end


  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end


  def index
    @post_images = PostImage.page(params[:page]).reverse_order
  end


  def show
    # idの画像を検索
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end


  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end


  private
  def post_image_params
    #ショップの名前、画像、説明のみ保存するため
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
