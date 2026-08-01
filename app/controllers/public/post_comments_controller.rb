class Public::PostCommentsController < Public::ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    @post_comment = current_user.post_comments.build(post_comment_params)
    @post_comment.post_image = @post_image
    if @post_comment.save
      redirect_to post_image_path(@post_image), notice: "コメントしました"
    else
      redirect_to post_image_path(@post_image), alert: "コメントできませんでした"
    end
  end

  def destroy
    @post_comment = current_user.post_comments.find(params[:id])
    @post_comment.destroy
    redirect_to post_image_path(params[:post_image_id]), notice: "コメントを削除しました"
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end