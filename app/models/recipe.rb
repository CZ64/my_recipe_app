class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :recipe_procedures,  dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :favorite_recipes,   dependent: :destroy

  accepts_nested_attributes_for :recipe_procedures,  allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  attachment :image

  def favorited_by?(user)
    favorite_recipes.where(user_id: user.id).exists?
  end

end
