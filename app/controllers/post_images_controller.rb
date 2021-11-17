class PostImagesController < ApplicationController
  def new
    @post_image=Post.new
  end

  def create
    @post_image=Post.new(post_params)
    @post_image.user_id=current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images=Post.all
  end

  def show
    @post_image=Post.find(params[:id])
  end

  def destroy
    @post_image=Post.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_params
    params.require(:post).permit(:shop_name, :image, :caption)
  end

end
