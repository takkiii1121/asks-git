class SonotasController < ApplicationController
  def index
    @asks = Ask.where(category_id: 5)
    @category = Category.find(5)
  end
end
