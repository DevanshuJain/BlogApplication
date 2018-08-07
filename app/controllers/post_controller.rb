class PostController < ApplicationController
  def index
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts
  end
   
  def show
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.new
#   @post = current_user.post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
    
  def update
    @blog = current_user.blogs.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])
 
 #   @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to blog_post_index_path
    else
      render :edit
    end
  end
    
  def new
    @post = Post.new
  end

  def verify
    @post = Post.find(params[:id])
    @post.update(published: true)    
    flash[:notice] = "Successfully verified!"
    redirect_to action: "index"
  end 
   
  def create
    @blog = current_user.blogs.find(params[:blog_id])
    @post = @blog.posts.new(post_params)
  # @post = @blog.post.find(params[:id])
    if @post.save
      redirect_to blog_index_path
    else
      render 'new'
    end
  end

  def destroy
    if @blog = current_user.blogs.find(params[:blog_id])
      @post = @blog.posts.find(params[:id])
      @post.destroy
      redirect_to blog_post_index_path
    else
      render 'new'
    end
  end
    
  private
    def post_params
      params.require(:post).permit(:title, :text, :avatar)
    end
end
