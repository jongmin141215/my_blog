class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]
  before_action :get_blog, only: [:index, :new, :create]
  before_action :get_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = @blog.articles.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = @blog.articles.new(article_params)
    #@article[:blog_id] = @blog.id
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

    def get_blog
      @blog = Blog.find(params[:blog_id])
    end

    def get_article
    @article = @blog.articles.all
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to root_path
      end
    end
end
