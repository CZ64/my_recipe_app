class UsersController < ApplicationController
  def favorite_recipes
    @favorite_recipes = current_user.recipes_through_favorite
    # @favorite_recipes = current_user.favorite_recipes.includes(:user)
    render '/favorite_recipes/index'
  end
end
