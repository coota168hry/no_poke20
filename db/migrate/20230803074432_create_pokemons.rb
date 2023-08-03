class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :poke_name
      t.integer :generation_id
      t.timestamps
    end
  end
end
