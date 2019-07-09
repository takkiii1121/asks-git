class RenaisController < ApplicationController
  def index
    @asks = Ask.where(category_id: 3)
    @category = Category.find(3)
  end
end
