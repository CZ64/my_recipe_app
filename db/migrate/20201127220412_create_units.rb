class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units, options: 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name

      t.timestamps
    end
  end
end
