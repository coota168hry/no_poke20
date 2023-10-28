class DropNews < ActiveRecord::Migration[7.0]
  def change
    drop_table :news do |t|
      t.string :title
      t.text :text
      t.date :display_date
      t.timestamps
    end
  end
end
