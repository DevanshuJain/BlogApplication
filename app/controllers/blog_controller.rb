class BlogController < ApplicationController
  def index
    @blog = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = current_user.blogs.find(params[:id])
  end

  def update
    @blog = current_user.blogs.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_index_path
    else
      render :edit
    end
  end

  def new
    @blog = current_user.blogs.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to blog_post_index_path(@blog) 
    else
      render 'new'
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    @blog.destroy
    redirect_to blog_index_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title)
    end
end
