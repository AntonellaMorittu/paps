class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.save
      flash[:success] = t('comment.success')
      redirect_to @article
    else
      flash[:error] = "Field cannot be blank."
      redirect_to article_path(@article)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:email, :content, :article_id)
  end
end
