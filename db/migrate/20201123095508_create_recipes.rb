class CreateRecipes < ActiveRecord::Migration[5.2]

  def change
    create_table :recipes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.string :image_id
      t.string :description
      t.integer :servings_for
      t.integer :cooking_time
      t.integer :draft,             default: 0  # 0:下書き, 1:公開
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end

    add_index :recipes, :title, unique: true
  end
end

