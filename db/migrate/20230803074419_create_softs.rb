class CreateSofts < ActiveRecord::Migration[7.0]
  def change
    create_table :softs do |t|

      t.timestamps
    end
  end
end
