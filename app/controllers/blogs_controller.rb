class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end
  def create
    @user = User.where(id: session[:user_id])
    @blog = Blog.new(blog_params)
    @blog[:user_id] = session[:user_id]
    @user[0][:blog_id] = @blog.id

    if @blog.save
      redirect_to blog_articles_path(@blog)
    else
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :description, :user_id)
    end
end
