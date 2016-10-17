class Todos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |table|
      table.string :detail
      table.boolean :done
      table.timestamps
    end
  end
end