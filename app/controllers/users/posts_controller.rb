class Users::PostsController < ApplicationController

  def index
    @posts = Post.order_by_recent.paginate(page: params[:page], per_page: 10)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments = @post.comments.order_by_recent
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save 
      flash[:success] = "Blog has been created successfuly"
      redirect_to users_posts_path
    else
      flash[:error] = @post.errors.full_messages.join("<br/>").html_safe
      redirect_to new_users_post_path
    end
  end

  private

  def post_params
    params.permit(:description, :title)
  end

end
