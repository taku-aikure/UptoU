class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all
    @search = Post.ransack(params[:q])
    @posts = @search.result
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @like = Like.new
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @post.update(post_without_image)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:detail, :season_id, :image ).merge(user_id: current_user.id)
  end

  def post_without_image
    params.require(:post).permit(:detail, :season_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless current_user.id == @post.user_id
  end

end
