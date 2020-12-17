class CreateRecipes < ActiveRecord::Migration[5.2]

  def change
    create_table :recipes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.string :image_id
      t.string :description
      t.integer :servings_for
      t.integer :cooking_time
      t.integer :public_view,             default: 0  # 0:公開, 1:下書き
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end

  end
end

