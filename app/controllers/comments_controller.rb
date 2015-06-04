class CommentsController < ApplicationController
  before_action :get_article, only: [:index, :new, :create]

  def index
    @comments = @article.comments  
  end

  def new
    if logged_in?
      @user = User.find(session[:user_id])
    else 
      flash[:danger] = 'Please log in.'
      redirect_to root_path
      
    end
    @comment = @article.comments.new
  end

  def create
    @comment = @article.comments.create(comment_params)
    @comment.save

    redirect_to blog_articles_path(@blog)
  end

  def update
  end

  def destroy 
  end

  private
    def get_article
      @article = Article.find(params[:article_id])
      @blog = @article.blog
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
