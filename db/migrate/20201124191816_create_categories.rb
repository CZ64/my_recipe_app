class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string  :name
      t.integer :user_id    # 0:デフォルトカテゴリー
      # todo: 関連するレシピ数を毎回数えず、保持するか考える

      t.timestamps
    end
  end
end
