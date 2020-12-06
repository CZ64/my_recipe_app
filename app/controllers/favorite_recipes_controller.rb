class FavoriteRecipesController < ApplicationController

    def create
      favorite_recipe = current_user.favorite_recipes.build(recipe_id: params[:recipe_id])
      favorite_recipe.save!
      redirect_back(fallback_location: root_path)
    end

    def destroy
      current_user.favorite_recipes.find_by(recipe_id: params[:recipe_id]).destroy!
      redirect_back(fallback_location: root_path)
    end
end