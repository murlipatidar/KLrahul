class PostsController < ApplicationController

before_action :set_post, only: [:show, :edit, :update, :destroy]

 
  def index
      # if current_user.present?
      #    @all_post = Post.find_by_user_id(@current_user.id)
      #    render template: 'post/index'
      # end

      if params[:status] == "draft"
        @posts = Post.where(status: "draft")

      elsif params[:status] == "unpublished"
        @posts = Post.where(status: "unpublished")

      else
        @posts = Post.order("created_at DESC")
      end
  end

  def show
  end

  def private
    
  end

  def draft_post
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new    
  end

  def create
    @post = Post.new(post_params)

    if @post.save 
      if @post.status == "unpublished"
        # redirect_to "/posts/private/"+@post.id.to_s
        redirect_to @post

      elsif @post.status == "published"
        redirect_to @post

      else
        # redirect_to "/posts/draft_post/"+@post.id.to_s
        redirect_to @post
      
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end


  def update

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @post.destroy
      redirect_to posts_path, status: :see_other
  end

  private


# Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:image, :status, :email)
  end

end
