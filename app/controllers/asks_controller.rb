class AsksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new]
  
  def index
    @asks = Ask.all.order(id: :desc).page(params[:page])
  end

  def show
    @ask = Ask.find(params[:id])
  end

  def new
    @ask = current_user.asks.new
  end

  def create
    @ask = Ask.new(ask_params)
    
    if @ask.save
      flash[:success] = 'お悩みを投稿しました'
      redirect_to asks_path
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @ask = Ask.find(params[:id])
    @ask.destroy
    flash[:success] = 'お悩みを削除しました'
    redirect_back(fallback_location: asks_path)
  end
  
  private
  
  def ask_params
    params.require(:ask).permit(:title, :content, :category_id, :user_id)
  end
  
  def correct_user
    @ask = current_user.asks.find_by(id: params[:id])
    unless @ask
    redirect_to root_url
    end
  end
end
