class KenkousController < ApplicationController
  def index
    @asks = Ask.where(category_id: 4)
    @category = Category.find(4)
  end
end
