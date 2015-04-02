class BlogsController < ApplicationController
  helper SessionsHelper
  before_action :logged_in_user, only: :create

  def new
    @blog = Blog.new
  end
  def create
    current_user
    if @current_user.blog.nil?
      @blog = @current_user.build_blog(blog_params) 
      if @blog.save
      redirect_to blog_articles_path(@blog)
      else
        render 'new'
      end
    else
      flash[:alert] = 'You already have a blog.'
      @blog = @current_user.blog
      redirect_to blog_articles_path(@blog)
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :description)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to root_path
      end
    end

end
