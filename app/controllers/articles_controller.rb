class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]

  
  def index
    @blog = Blog.find(params[:blog_id])
    @articles = @blog.articles.order(created_at: :desc)
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @article = Article.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @article = Article.new(article_params)
    @article[:blog_id] = @blog.id
    if @article.save
      flash[:alert] = "An article is successfully created."
      redirect_to blog_articles_path(@blog)
    else
      render 'new'
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
    flash[:danger] = "Deleted"
    redirect_to articles_path
    
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end

    def get_article
    @article = Article.find(params[:id])
    end
end
