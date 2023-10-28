class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :class_code
      t.string :title
      t.text :text
      t.text :remarks
      t.timestamps
    end
  end
end
