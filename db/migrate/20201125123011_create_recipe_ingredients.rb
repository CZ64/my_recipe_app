class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :quantity
      t.integer :gram
      t.integer :order_id
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :unit_id

      t.timestamps
    end
  end
end
