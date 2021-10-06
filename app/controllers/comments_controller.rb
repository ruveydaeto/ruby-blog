class CommentsController < ApplicationController

  def create
    binding.irb
    @article = Article.new(params[:article_id])
    @comment = @article.comments.new(comment_params)
    if @article.save
      flash[:notice] = "Your Article was Created"
    else 
      flash[:error] = @article.errors.full_messages
    end
    redirect_to articles_path

  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
  end
end