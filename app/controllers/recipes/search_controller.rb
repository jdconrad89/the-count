class Recipes::SearchController < ApplicationController

  def index
    @item = params[:q]
    @food_items = Food.find_by_title(params[:q])
  end

end
