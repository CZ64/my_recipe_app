class HomeController < ApplicationController
  def index
    @categories = Category.includes(:recipes)
                          .sort { |a, b| b.recipes.size <=> a.recipes.size }
    # TODO: ランキング表示
    @weekly_recipes  = Recipe.get_ranking_from(Time.current.beginning_of_week)
    @monthly_recipes = Recipe.get_ranking_from(Time.current.beginning_of_month)
    @total_recipes   = Recipe.get_ranking_from
  end
end
