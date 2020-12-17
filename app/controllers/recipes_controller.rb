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

    # 既存の材料idか、新規作成して材料idを設定する
    @recipe.recipe_ingredients.each do |ingredient|
      ingredient.ingredient_id = Ingredient.get_id(ingredient.name, true)
    end

    if @recipe.save
      redirect_to recipes_path, success: '投稿に成功しました！'
    else
      @categories = Category.all
      @units = Unit.all
      render 'new'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @menu = current_user.menus.build
  end

  private
  
  def recipe_params
    params.require(:recipe).permit(
      :title, :image, :description, :cooking_time, :servings_for, :public_view, :category_id,
      recipe_procedures_attributes: %i[id instruction image _destroy],
      recipe_ingredients_attributes: %i[id quantity gram ingredient_id unit_id _destroy name]
    )
  end

end
