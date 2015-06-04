class UsersController < ApplicationController

  def index
    if logged_in?
      @user = User.find(session[:user_id])
      @blog = @user.blog
    end
    if params[:search].present? && User.search(params[:search])
      @users = User.search(params[:search]).order(created_at: :desc)
      if @users.any?
        @blog = Blog.find_by(user_id: @users[0].id)
      else
        flash[:search] = "No results found"
        redirect_to root_path
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def about
  end

  def contact
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
