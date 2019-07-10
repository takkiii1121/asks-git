class SessionsController < ApplicationController
  def new
    render layout: false
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      flash[:success] = 'ログインに成功しました'
      redirect_to asks_path
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end
  
end
