class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments  
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(secure_params)
    @comment.save

    redirect_to articles_path
  end

  def update
  end

  def destroy 
  end

  private
    def secure_params
      params.require(:comment).permit(:commenter, :body)
    end

end
