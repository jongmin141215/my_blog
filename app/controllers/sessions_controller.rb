class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to articles_path
    else
      flash.now[:danger] = 'Invalid email/passowrd combination'
      render '/welcome/index'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
