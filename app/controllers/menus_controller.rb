class MenusController < ApplicationController
  def create
    menu = current_user.menus.build(menu_params)
    menu.save!
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # current_user.favorite_recipes.find_by(recipe_id: params[:recipe_id]).destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  def menu_params
    params.require(:menu).permit(:servings_for, :recipe_id)
  end
end
