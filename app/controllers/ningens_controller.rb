class NingensController < ApplicationController
  def index
    @asks = Ask.where(category_id: 1)
    @category = Category.find(1)
  end
end
