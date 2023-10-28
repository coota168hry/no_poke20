class AddDelflgToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :del_flg, :char
  end
end
