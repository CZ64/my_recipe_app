class RecipeProcedure < ApplicationRecord
  belongs_to :recipe

  attachment :image
end
