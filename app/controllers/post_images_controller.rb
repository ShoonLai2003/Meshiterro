class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

   # 投稿データの保存
   def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = Current.user.id
    @post_image.save
    redirect_to post_images_path
  end

  def destroy
    post_image = 削除するPostImageレコードを取得
    post_image.削除
    redirect_to PostImageの一覧ページへのパス
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

   # 投稿データのストロングパラメータ
   private

   def post_image_params
     params.require(:post_image).permit(:shop_name, :image, :caption)
   end
end
