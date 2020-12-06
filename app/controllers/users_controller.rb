class UsersController < ApplicationController

  def menus
    @menus = current_user.menus.includes(:recipe)
    render '/menus/index'
  end

  def favorite_recipes
    @favorite_recipes = current_user.recipes_through_favorite.includes(:user)
    render '/favorite_recipes/index'
  end
end
