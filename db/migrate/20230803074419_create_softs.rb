class CreateSofts < ActiveRecord::Migration[7.0]
  def change
    create_table :softs do |t|
      t.string :soft_name
      t.integer :generation_id
      t.timestamps
    end
  end
end
