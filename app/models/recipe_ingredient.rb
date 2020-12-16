class RecipeIngredient < ApplicationRecord

  attr_accessor :name

  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit

end
