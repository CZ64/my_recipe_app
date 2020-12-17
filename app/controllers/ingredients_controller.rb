class IngredientsController < ApplicationController
  def index
    @unit  = Unit.new
    @units = Unit.all

    @ingredient  = Ingredient.new
    @ingredients = Ingredient.all
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :unit_id)
  end
end
