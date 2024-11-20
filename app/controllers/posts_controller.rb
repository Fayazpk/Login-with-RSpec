class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to posts_path, notice: "Post created successfully."
    else
      Rails.logger.debug post.errors.full_messages # Logs validation errors
      flash.now[:alert] = "Error creating post."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post), notice: "Post updated successfully."
    else
      flash.now[:alert] = "Error updating post."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find_by(params[:id])
    post.destroy
    redirect_to posts_path, notice: "Post deleted successfully."
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
