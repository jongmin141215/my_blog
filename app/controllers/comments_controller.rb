class CommentsController < ApplicationController
  before_action :get_article, only: [:index, :new, :create]

  def index
    @comments = @article.comments  
  end

  def new
    @comment = @article.comments.new
  end

  def create
    @comment = @article.comments.create(secure_params)
    @comment.save

    redirect_to articles_path
  end

  def update
  end

  def destroy 
  end

  private
    def get_article
      @article = Article.find(params[:article_id])
    end

    def secure_params
      params.require(:comment).permit(:commenter, :body)
    end

end
