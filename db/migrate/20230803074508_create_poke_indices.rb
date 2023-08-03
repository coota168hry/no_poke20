class CreatePokeIndices < ActiveRecord::Migration[7.0]
  def change
    create_table :poke_indices do |t|
      t.integer :pokemon_id
      t.integer :soft_id
      t.text :index_text
      t.timestamps
    end
  end
end
