class Public::FavoritesController < Public::ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    current_user.favorites.create(post_image: @post_image)
    redirect_to post_image_path(@post_image)
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image: @post_image)
    favorite&.destroy
    redirect_to post_image_path(@post_image)
  end
end
