class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュールを登録しました。"
      redirect_to posts_path
    else
      flash[:alert] = "スケジュールを登録できませんでした。"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "スケジュール#{@post.id}の更新が完了しました。"
      redirect_to posts_path
    else
      flash[:alert] = "スケジュール#{@post.id}の更新ができませんでした。"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュール#{@post.id}の削除が完了しました。"
    redirect_to :posts
  end

  private
  def post_params
    params.require(:post).permit(:title, :start_day, :end_day, :all_day, :memo)
  end
end
