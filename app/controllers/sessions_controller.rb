class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      @blog = Blog.find_by(user_id: @user.id)
      if @blog
        redirect_to blog_articles_path(@blog)
      else
        redirect_to @user
      end
    else
      flash[:danger] = 'Invalid email/passowrd combination'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
