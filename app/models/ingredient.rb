class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :user_ingredients,   dependent: :destroy

  # 該当なしの場合、作成してidを返すか,nilを返すか選択
  def self.get_id(name, new_create = false)
    ingredient = Ingredient.find_by(name: name)

    if ingredient.nil? && new_create
      ingredient = Ingredient.new(name: name)
      ingredient.save
    end
    ingredient.id
  end
end
