class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @categories = Category.all
    @units = Unit.all
    recipe_procedures = @recipe.recipe_procedures.build
    recipe_ingredients = @recipe.recipe_ingredients.build
    # TODO: 下書き機能実装
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    # TODO: 材料id
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :title, :image, :description, :cooking_time, :servings_for, :category_id,
        recipe_procedures_attributes: [:id, :instruction, :image, :_destroy],
        recipe_ingredients_attributes: [:id, :quantity, :gram, :ingredient_id, :unit_id, :_destroy, :name]
        )
    end

end
