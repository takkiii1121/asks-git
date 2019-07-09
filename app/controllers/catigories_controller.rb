class CatigoriesController < ApplicationController
  def new
  end

  def create
    @category = Category.find(params[:id])
    if @category.save
      redirect_to asks_path
    else
      render new_ask_path
    end
  end

  def destroy
  end
end
