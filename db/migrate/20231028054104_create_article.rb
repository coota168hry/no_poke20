class CreateArticle < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.date :display_date
      t.timestamps
    end
  end
end
