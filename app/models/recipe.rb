class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :recipe_procedures,  dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :menu,               dependent: :destroy
  has_many :favorite_recipes,   dependent: :destroy

  accepts_nested_attributes_for :recipe_procedures,  allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  attachment :image

  # validations
  validates :title,  presence: true, length: { maximum: 10 }

  # TODO: 要テスト
  def self.get_ranking_from(from = Time.local(2000))
    Recipe.find(FavoriteRecipe.group(:recipe_id).where('created_at >= ?', from).
      order('count(recipe_id) desc').limit(10).pluck(:recipe_id))
  end

  def favorited_by?(user)
    favorite_recipes.where(user_id: user.id).exists?
  end

end
