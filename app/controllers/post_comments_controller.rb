class PostCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    # 以下の７行目は下記のような記述と同一
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end


  def destroy
    PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    # commentだけ、データの送信を許す
    params.require(:post_comment).permit(:comment)
  end

end
