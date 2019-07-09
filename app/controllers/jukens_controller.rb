class JukensController < ApplicationController
  def index
    @asks = Ask.where(category_id: 2)
    @category = Category.find(2)
  end
end
