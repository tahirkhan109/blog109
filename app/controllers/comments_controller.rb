class CommentsController < ApplicationController
def create
puts "11111111111111111111111",params.inspect
  @post = Post.find(params[:post_id])
  @comment = @post.comments.new(params[:comment].permit(:commenter, :body))
  if @comment.save
    redirect_to post_path(@post)
  else
render 'new'
  end


end

  def destroy
  puts "aaaaaaaaaaaaaaaaaaaaaaa",params.inspect
    @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
    redirect_to post_path(@post)
  end


end
