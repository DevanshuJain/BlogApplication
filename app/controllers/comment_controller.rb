class CommentController < ApplicationController
  def index
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    @comments = @post.comments   
  end
   
  def show
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    @comment= @post.comments.all    
  end

  def edit
    @comments = Comment.find(params[:id])
  end
    
  def update
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    #@comment = Comment
    if @comments.update(comment_params)
      redirect_to blog_post_index_path
    else
      render :edit
    end   
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    @comment = @post.comments.new
  end
   
  def create
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    @comment= @post.comments.new(comment_params)
    #@ccc= @post.comments
     @comments = @post.comments 
    @comment.save
   #  redirect_to blog_post_path(@post.blog.id,@post.id)
   #   end
  # end
    respond_to do |format|
      format.js
    end
 end
    
  def destroy
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_post_comment_index_path
  end

  private
    def comment_params
      params.require(:comment).permit(:commitment)
    end
end
