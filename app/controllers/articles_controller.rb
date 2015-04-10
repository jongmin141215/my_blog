class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]
  before_action :get_blog
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = @blog.articles.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    current_user
    unless @current_user.blog == @blog
      flash[:alert] = "You can't create a post on someone else's blog."
      redirect_to blog_articles_path(@blog)
    else
      @article = @blog.articles.new(article_params)
        if @article.save
          flash[:alert] = "Post successfully created."
          redirect_to blog_articles_path(@blog)
        else
          render 'new'
        end
    end
  end

  
  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to blog_articles_path(@blog)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Post successfully deleted"
    redirect_to blog_articles_path(@blog)
    
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end

    def get_blog
      @blog = Blog.find(params[:blog_id])
    end

    def get_article
      @article = @blog.articles.find(params[:id])
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to root_path
      end
    end
end
