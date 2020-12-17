class UserIngredient < ApplicationRecord
  attr_accessor :name

  belongs_to :user
  belongs_to :ingredient
  belongs_to :unit
end
