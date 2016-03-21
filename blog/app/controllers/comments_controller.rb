class CommentsController < ApplicationController

  http_basic_authenticate_with name: 'jp', password: 'jpjp', only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    # Article.find(params[:article_id]).comments.find(params[:id]).destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@artsicle)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
