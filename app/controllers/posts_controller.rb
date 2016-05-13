class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]

  def index
    @post = Post.all.order('created_at DESC')
  end

  def show
  end

  def new
    # @post = current_user.posts.build
    @post = Post.new
  end

  def create
    # @post = current_user.posts.build post_params
    @post = Post.new

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to @post
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :link, :description)
  end
end