class CommentsController < ApplicationController
  http_basic_authenticate_with name: "tahir", password: "tahir", only: :destroy
def index
end
def create
puts "111111111111111111111111111",params.inspect
  @post = Post.find(params[:post_id])
@comment = @post.comments.new(params[:comment].permit(:commenter,:body))
  if @comment.save
    redirect_to @post
  else
    render 'new'
  end

end
  def destroy
  puts "2222222222222222222222222",params.inspect
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
     if @comment.destroy
     redirect_to post_path(@post)
     end

  end


end
