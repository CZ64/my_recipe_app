class CreateRecipeProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_procedures, options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :instruction
      t.string :image_id
      t.integer :sort_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
