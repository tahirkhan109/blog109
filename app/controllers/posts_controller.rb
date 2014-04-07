class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to @post
    end
  end

  def show
  @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
    redirect_to posts_path
    end
  end
  def edit
  @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
   if @post.update_attributes(params[:post].permit(:title, :text))
    redirect_to posts_path
   else
     render "edit"
   end

  end

end
private
def params_post
  params[:post].permit(:title, :text)
end
