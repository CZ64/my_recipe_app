class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes,          dependent: :destroy
  has_many :user_ingredients, dependent: :destroy
  has_many :menus,            dependent: :destroy
  has_many :favorite_recipes, dependent: :destroy
  has_many :recipes_through_favorite, through: :favorite_recipes, source: :recipe

  # validations
  validates :name,  presence: true, uniqueness: true, length: { in: 3..8 }
  validates :servings_for,  presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 1
                            }
end
