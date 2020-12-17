class CreateRecipeProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_procedures, options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :instruction
      t.string :image_id
      t.integer :order_id  # 手順の順番を変更時に使用
      t.integer :recipe_id

      t.timestamps
    end
  end
end
