class CreatePokeIndices < ActiveRecord::Migration[7.0]
  def change
    create_table :poke_indices do |t|

      t.timestamps
    end
  end
end
