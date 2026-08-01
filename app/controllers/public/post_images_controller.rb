class Public::PostImagesController < Public::ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = current_user.post_images.build(post_image_params)
    if @post_image.save
      redirect_to post_images_path, notice: "投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = current_user.post_images.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path, notice: "投稿を削除しました"
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end