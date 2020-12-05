class UserIngredientsController < ApplicationController

  def index
    @user_ingredient = UserIngredient.new
    @units = Unit.all
    @user_ingredients = UserIngredient.all
  end

  def create
    @user_ingredient = current_user.user_ingredients.new(user_ingredient_params)
    @user_ingredient.ingredient_id = Ingredient.get_id(@user_ingredient.name, true)
    @user_ingredient.save!
    redirect_to user_ingredients_path
  end

  private

    def user_ingredient_params
      params.require(:user_ingredient).permit(
        :name, :quantity, :expiration_date, :ingredient_id, :unit_id, :_destroy
      )
    end
end
