class CreateRecipes < ActiveRecord::Migration[5.2]

  def change
    create_table :recipes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.string :image
      t.string :description
      t.integer :servings_for
      t.integer :cooking_time
      t.integer :weekly_favorites,  default: 0
      t.integer :total_favorites,   default: 0
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end

    add_index :recipes, :title, unique: true
  end
end

